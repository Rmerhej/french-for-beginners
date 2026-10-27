package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.nullValue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class SecurityHeadersIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void publicPageCarriesTheSecurityHeaders() throws Exception {
        mockMvc.perform(get("/login"))
                .andExpect(status().isOk())
                .andExpect(header().string("X-Content-Type-Options", "nosniff"))
                .andExpect(header().string("Referrer-Policy", "strict-origin-when-cross-origin"))
                .andExpect(header().string("Permissions-Policy", containsString("camera=()")))
                .andExpect(header().string("Permissions-Policy", containsString("microphone=()")))
                .andExpect(header().string("Content-Security-Policy", containsString("object-src 'none'")))
                .andExpect(header().string("Content-Security-Policy", containsString("frame-ancestors 'self'")))
                .andExpect(header().string("Content-Security-Policy", containsString("base-uri 'self'")))
                .andExpect(header().string("Content-Security-Policy", containsString("form-action 'self'")));
    }

    @Test
    void hstsIsSentOnlyOnHttps() throws Exception {
        mockMvc.perform(get("/login").secure(true))
                .andExpect(header().string("Strict-Transport-Security", containsString("max-age=31536000")));
        mockMvc.perform(get("/login"))
                .andExpect(header().string("Strict-Transport-Security", nullValue()));
    }

    @Test
    void staticFilesAreNotSniffedEither() throws Exception {
        mockMvc.perform(get("/css/grammar-hero-sections.css"))
                .andExpect(header().string("X-Content-Type-Options", "nosniff"));
    }
}
