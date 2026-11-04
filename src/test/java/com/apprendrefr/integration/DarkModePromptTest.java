package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Proposition du mode sombre aux personnes connectées (notification avec « Activer » et « Ne plus afficher »). */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class DarkModePromptTest {

    private static final Path STATIC = Path.of("src/main/resources/static");

    @Autowired
    private MockMvc mockMvc;

    private static String read(String file) throws IOException {
        return Files.readString(STATIC.resolve(file));
    }

    @Test
    void everyPageLoadsThePromptScript_afterTheToastScript() throws Exception {
        String html = mockMvc.perform(get("/laFrance").with(user("apprenant").roles("USER")))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("/js/dark-mode-prompt.js")))
                .andReturn().getResponse().getContentAsString();
        assertThat(html.indexOf("/js/toast.js")).isLessThan(html.indexOf("/js/dark-mode-prompt.js"));
        assertThat(html.indexOf("window.FFB_AUTH = true")).isLessThan(html.indexOf("/js/dark-mode-prompt.js"));
    }

    @Test
    void scriptIsServed() throws Exception {
        mockMvc.perform(get("/js/dark-mode-prompt.js"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("darkPromptOff")));
    }

    @Test
    void promptOnlyForConnectedUsers_neverWhenDarkIsActive_andRespectsTheChoice() throws IOException {
        String js = read("js/dark-mode-prompt.js");
        assertThat(js).contains("window.FFB_AUTH")
                .contains("data-bs-theme") .contains("=== 'dark'")
                .contains("KEY_OFF").contains("localStorage")
                .contains("KEY_SEEN").contains("sessionStorage")
                .contains("Ne plus afficher").contains("Activer le mode sombre");
    }

    @Test
    void storageAccessIsProtectedAgainstBlockedBrowsers() throws IOException {
        String js = read("js/dark-mode-prompt.js");
        assertThat(js).contains("try {").contains("catch (e)");
        String footer = Files.readString(Path.of("src/main/resources/templates/fragments/footer.html"));
        assertThat(footer).contains("try { savedTheme = localStorage.getItem('theme')")
                .contains("try { localStorage.setItem('theme', newTheme)");
    }

    @Test
    void toastsSupportActionButtons_withStyles() throws IOException {
        assertThat(read("js/toast.js")).contains("actions").contains("ffb-toast-action").contains("focusin");
        assertThat(read("css/theme.css")).contains(".ffb-toast-actions").contains(".ffb-toast-action-primary");
    }
}
