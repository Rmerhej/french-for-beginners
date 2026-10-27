package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class RgpdPageIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void privacyPageExplainsTheLoginActivityAndLogs() throws Exception {
        mockMvc.perform(get("/rgpd"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Connexions et déconnexions")))
                .andExpect(content().string(containsString("jamais enregistrées en base de données")))
                .andExpect(content().string(containsString("Adresses IP et journaux techniques")))
                .andExpect(content().string(containsString("inscriptions")));
    }
}
