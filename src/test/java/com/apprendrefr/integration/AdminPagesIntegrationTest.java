package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrlPattern;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Les pages de gestion : réservées aux administrateurs, et qui s'affichent même sans données. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class AdminPagesIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @ParameterizedTest
    @ValueSource(strings = {"/admin/lessons", "/admin/users", "/admin/quizzes",
            "/admin/vocabulary", "/admin/exercises", "/admin/themes"})
    @WithMockUser(roles = "ADMIN")
    void adminCanOpenManagementList(String url) throws Exception {
        mockMvc.perform(get(url)).andExpect(status().isOk());
    }

    @ParameterizedTest
    @ValueSource(strings = {"/admin/lessons", "/admin/users", "/admin/quizzes",
            "/admin/vocabulary", "/admin/exercises", "/admin/themes"})
    @WithMockUser(roles = "USER")
    void simpleUserIsForbidden(String url) throws Exception {
        mockMvc.perform(get(url)).andExpect(status().isForbidden());
    }

    @ParameterizedTest
    @ValueSource(strings = {"/admin/lessons", "/admin/users", "/admin/quizzes",
            "/admin/vocabulary", "/admin/exercises", "/admin/themes"})
    void visitorIsSentToLogin(String url) throws Exception {
        mockMvc.perform(get(url))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrlPattern("**/login"));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void removedRoute_isNotFound() throws Exception {
        mockMvc.perform(get("/admin/lessons-list")).andExpect(status().isNotFound());
    }
}
