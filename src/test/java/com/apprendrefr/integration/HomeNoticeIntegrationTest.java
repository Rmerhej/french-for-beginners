package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Le message de la page d'accueil doit rester cohérent avec la page RGPD (comptes réels, inscription libre). */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class HomeNoticeIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void homeDoesNotClaimToBeATestSiteWithFakeAccounts() throws Exception {
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Projet associatif et bénévole")))
                .andExpect(content().string(containsString("href=\"/rgpd\"")))
                .andExpect(content().string(not(containsString("phase de test"))))
                .andExpect(content().string(not(containsString("comptes sont fictifs"))))
                .andExpect(content().string(not(containsString("purgées régulièrement"))));
    }
}
