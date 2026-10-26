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

/** La page RGPD doit décrire l'utilisation sans compte, maintenant que les cours sont ouverts à tous. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class RgpdPageIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void rgpdPage_isPublic_andExplainsUseWithoutAccount() throws Exception {
        mockMvc.perform(get("/rgpd"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Utilisation sans compte")))
                .andExpect(content().string(containsString("Visiter le site sans compte")))
                .andExpect(content().string(containsString("Visiteurs en ligne")));
    }
}
