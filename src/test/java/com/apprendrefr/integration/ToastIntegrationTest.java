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
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Notifications (toasts) : le script est chargé partout et remplace les fenêtres alert() du navigateur. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ToastIntegrationTest {

    private static final Path RESOURCES = Path.of("src/main/resources");

    @Autowired
    private MockMvc mockMvc;

    @Test
    void toastScript_isPublic_andRevalidated() throws Exception {
        mockMvc.perform(get("/js/toast.js"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("window.FFBToast")))
                .andExpect(header().string("Cache-Control", containsString("no-cache")));
    }

    @Test
    void everyPage_loadsTheToastScript_throughTheFooter() throws Exception {
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("/js/toast.js")));
    }

    @Test
    void toastScript_neverInsertsHtml() throws IOException {
        String js = Files.readString(RESOURCES.resolve("static/js/toast.js"));
        assertThat(js).contains("textContent = String(message)");
        assertThat(js).doesNotContain("innerHTML = message").doesNotContain("innerHTML = String(message)");
    }

    @Test
    void answerChecks_useToasts_notBrowserAlerts() throws IOException {
        for (String f : new String[]{"static/js/exercises.js", "static/js/lesson-exercises.js",
                "static/js/au-bureau.js", "templates/evaluation.html"}) {
            String src = Files.readString(RESOURCES.resolve(f));
            assertThat(src).as(f).contains("FFBToast.warning");
            // alert() n'est plus qu'un secours si le script de notifications manque
            assertThat(src).as(f).contains("FFBToast ? FFBToast.");
        }
    }

    @Test
    void placementLevel_confirmationIsAToast() throws IOException {
        String src = Files.readString(RESOURCES.resolve("templates/evaluation.html"));
        assertThat(src).contains("FFBToast.success('Niveau enregistré");
        assertThat(src).doesNotContain("placement-saved");
    }

    @Test
    void adminFlashMessages_areToasts() throws IOException {
        for (String f : new String[]{"users-list", "dashboard", "exercises-list", "lessons-list"}) {
            String src = Files.readString(RESOURCES.resolve("templates/admin/" + f + ".html"));
            assertThat(src).as(f).contains("data-ffb-toast=\"success\"").contains("data-ffb-toast=\"error\"");
            assertThat(src).as(f).doesNotContain("alert alert-success alert-dismissible");
        }
    }
}
