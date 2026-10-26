package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import org.springframework.test.context.ActiveProfiles;
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class SecurityIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void publicPages_areAccessible() throws Exception {
        mockMvc.perform(get("/")).andExpect(status().isOk());
        mockMvc.perform(get("/login")).andExpect(status().isOk());
        mockMvc.perform(get("/register")).andExpect(status().isOk());
        mockMvc.perform(get("/about")).andExpect(status().isOk());
    }

    /** Consultation ouverte à tous : cours, quiz, thèmes, conjugueur, test de niveau… */
    @ParameterizedTest
    @ValueSource(strings = {"/lessons", "/niveauDebutant", "/niveauConsolidation", "/niveauApprofondissement",
            "/supports-de-cours", "/conjugueur", "/testEval", "/themes", "/quiz/drag-drop?recherche=Test",
            "/negationApprofondie", "/typesDePhrases", "/LeSubjonctif", "/AuCafé", "/laFrance"})
    void contentPages_areOpenWithoutAccount(String path) throws Exception {
        mockMvc.perform(get(path)).andExpect(status().isOk());
    }

    @Test
    void unknownQuiz_withoutAccount_goesBackToTheCourseList() throws Exception {
        mockMvc.perform(get("/quiz/{id}", 999999999L))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/supports-de-cours"));
    }

    /** Enregistrer ou consulter ses résultats demande toujours un compte. */
    @ParameterizedTest
    @ValueSource(strings = {"/quizzes", "/mes-resultats", "/exercise/my-results", "/quiz/my-results", "/dashboard"})
    void personalPages_stillRedirectToLogin_whenNotAuthenticated(String path) throws Exception {
        mockMvc.perform(get(path))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrlPattern("**/login"));
    }

    @Test
    @WithMockUser(roles = "USER")
    void userCannotAccessAdmin() throws Exception {
        mockMvc.perform(get("/admin/dashboard"))
                .andExpect(status().isForbidden());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void adminCanAccessAdminPages() throws Exception {
        mockMvc.perform(get("/admin/dashboard"))
                .andExpect(status().isOk());
    }

    @Test
    @WithMockUser(roles = "USER")
    void authenticatedUserCanAccessLessons() throws Exception {
        mockMvc.perform(get("/lessons"))
                .andExpect(status().isOk());
    }
}
