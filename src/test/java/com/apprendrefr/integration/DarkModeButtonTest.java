package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Le bouton « Sombre » du menu est proposé à tous les visiteurs, connectés ou non (une seule fois par page). */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class DarkModeButtonTest {

    @Autowired
    private MockMvc mockMvc;

    private static int count(String text, String part) {
        int n = 0;
        for (int i = text.indexOf(part); i >= 0; i = text.indexOf(part, i + part.length())) {
            n++;
        }
        return n;
    }

    @Test
    void anonymousVisitorSeesTheButton_once() throws Exception {
        String html = mockMvc.perform(get("/laFrance"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("id=\"darkModeToggle\"")))
                .andReturn().getResponse().getContentAsString();
        org.assertj.core.api.Assertions.assertThat(count(html, "id=\"darkModeToggle\"")).isEqualTo(1);
    }

    @Test
    void connectedUserSeesTheButton_once() throws Exception {
        String html = mockMvc.perform(get("/laFrance").with(user("apprenant").roles("USER")))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("id=\"darkModeToggle\"")))
                .andReturn().getResponse().getContentAsString();
        org.assertj.core.api.Assertions.assertThat(count(html, "id=\"darkModeToggle\"")).isEqualTo(1);
    }
}
