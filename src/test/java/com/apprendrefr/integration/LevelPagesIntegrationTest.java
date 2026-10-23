package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class LevelPagesIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    @WithMockUser
    void debutant_pointsToLevelA1() throws Exception {
        mockMvc.perform(get("/niveauDebutant"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Pré-A1 → A1")))
                .andExpect(content().string(containsString("/supports-de-cours?niveau=A1")));
    }

    @Test
    @WithMockUser
    void consolidation_pointsToLevelA2() throws Exception {
        mockMvc.perform(get("/niveauConsolidation"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("A1 → A2")))
                .andExpect(content().string(containsString("/supports-de-cours?niveau=A2")));
    }

    @Test
    @WithMockUser
    void approfondissement_pointsToLevelsB1AndB2() throws Exception {
        mockMvc.perform(get("/niveauApprofondissement"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("A2 → B2")))
                .andExpect(content().string(containsString("/supports-de-cours?niveau=B1")))
                .andExpect(content().string(containsString("/supports-de-cours?niveau=B2")));
    }

    @Test
    void supportsPage_canBeFilteredOnOneLevel() throws Exception {
        mockMvc.perform(get("/supports-de-cours").param("niveau", "A2"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("id=\"niveau-A2\"")))
                .andExpect(content().string(org.hamcrest.Matchers.not(containsString("id=\"niveau-B1\""))))
                .andExpect(content().string(containsString("Voir tous les niveaux")));
    }

    @Test
    void supportsPage_showsAllLevelsWithoutFilter() throws Exception {
        mockMvc.perform(get("/supports-de-cours"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("id=\"niveau-A1\"")))
                .andExpect(content().string(containsString("id=\"niveau-B2\"")));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void parcoursCheck_isAvailableToAdmin() throws Exception {
        mockMvc.perform(get("/admin/parcours-check"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Contrôle du parcours")));
    }

    @Test
    @WithMockUser(roles = "USER")
    void parcoursCheck_isForbiddenToLearners() throws Exception {
        mockMvc.perform(get("/admin/parcours-check"))
                .andExpect(status().isForbidden());
    }
}
