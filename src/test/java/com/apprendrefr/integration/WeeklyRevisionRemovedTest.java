package com.apprendrefr.integration;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.junit.jupiter.api.Test;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** La « révision hebdomadaire » (quiz et QCM de préparation) et ses pages ont été supprimées. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class WeeklyRevisionRemovedTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void consolidationPage_hasNoWeeklyRevisionSection_norLocalUnitCard() throws Exception {
        mockMvc.perform(get("/niveauConsolidation")).andExpect(status().isOk())
                .andExpect(content().string(not(containsString("Révision Hebdomadaire"))))
                .andExpect(content().string(not(containsString("preparation-quiz-index"))))
                .andExpect(content().string(not(containsString("preparation-list-index"))))
                .andExpect(content().string(not(containsString("Unité locale"))));
    }

    @ParameterizedTest
    @ValueSource(strings = {"/preparation-list-index", "/preparation-quiz-index", "/AuCafé", "/AuCaféQuiz",
            "/laFac", "/facQuiz", "/togoToAuBureu", "/admin/preparation/new"})
    @WithMockUser(roles = "ADMIN")
    void removedPages_areNotFound(String path) throws Exception {
        mockMvc.perform(get(path)).andExpect(status().isNotFound());
    }
}
