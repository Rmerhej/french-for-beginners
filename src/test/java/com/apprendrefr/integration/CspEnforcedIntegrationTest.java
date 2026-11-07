package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.hamcrest.Matchers.nullValue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Avec APP_CSP_ENFORCE=true : la politique stricte est obligatoire, et plus seulement signalée. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestPropertySource(properties = "app.security.csp-enforce=true")
class CspEnforcedIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void strictPolicyIsEnforced_withoutAnyExternalHost() throws Exception {
        mockMvc.perform(get("/login"))
                .andExpect(status().isOk())
                .andExpect(header().string("Content-Security-Policy", containsString("default-src 'self'")))
                .andExpect(header().string("Content-Security-Policy", containsString("object-src 'none'")))
                .andExpect(header().string("Content-Security-Policy", containsString("form-action 'self'")))
                .andExpect(header().string("Content-Security-Policy", not(containsString("http"))))
                .andExpect(header().string("Content-Security-Policy", containsString("script-src 'self'; style-src")))
                .andExpect(header().string("Content-Security-Policy", not(containsString("script-src 'self' 'unsafe-inline'"))))
                .andExpect(header().string("Content-Security-Policy-Report-Only", nullValue()));
    }
}
