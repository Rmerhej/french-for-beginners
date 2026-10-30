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
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * Éléments communs à toutes les pages (menu, pied de page, boutons flottants) et services externes.
 * Garde-fous : aucune page ne dépend d'un service tiers autre que le CDN Bootstrap (RGPD, mode hors ligne).
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class SiteShellPolishTest {

    private static final Path RESOURCES = Path.of("src/main/resources");

    @Autowired
    private MockMvc mockMvc;

    private static String read(String f) throws IOException {
        return Files.readString(RESOURCES.resolve(f));
    }

    @Test
    void noPage_loadsFontAwesome_orTheRemoteFlag() throws IOException {
        try (Stream<Path> s = Files.walk(RESOURCES.resolve("templates"))) {
            for (Path p : s.filter(f -> f.toString().endsWith(".html")).toList()) {
                assertThat(Files.readString(p)).as(p.toString())
                        .doesNotContain("font-awesome").doesNotContain("flagcdn.com").doesNotContain("cdnjs.cloudflare.com")
                        .doesNotContainPattern("class=\"[^\"]*\\bfa[srb]? fa-");
            }
        }
    }

    @Test
    void flag_isHostedOnTheSite() throws Exception {
        assertThat(read("templates/fragments/navbar.html")).contains("/images/flag-fr.svg");
        mockMvc.perform(get("/images/flag-fr.svg")).andExpect(status().isOk())
                .andExpect(content().string(containsString("<svg")));
    }

    @Test
    void rgpdPage_listsOnlyTheRemainingExternalService() throws Exception {
        mockMvc.perform(get("/rgpd")).andExpect(status().isOk())
                .andExpect(content().string(containsString("jsDelivr")))
                .andExpect(content().string(not(containsString("cdnjs"))))
                .andExpect(content().string(not(containsString("flagcdn"))));
    }

    @Test
    void footerAndFloatingButtons_haveComfortableTouchTargets() throws IOException {
        String footer = read("templates/fragments/footer.html");
        assertThat(footer).contains("footer-links").doesNotContain("border-light border-2");
        String top = read("templates/fragments/back-to-top.html");
        assertThat(top).doesNotContain("width: 25px");
        String css = read("static/css/theme.css");
        assertThat(css).contains("#btn-top").contains("width: 48px").contains(".footer-links a");
        assertThat(css).contains(".navbar-brand").contains("white-space: normal");
    }

    @Test
    void adminAndResultTables_scrollInsideATableResponsiveBlock() throws IOException {
        for (String f : new String[]{"users-list", "exercises-list", "lessons-list", "vocabulary-list",
                "quizzes-list", "themes-list", "prononciation-list"}) {
            String html = read("templates/admin/" + f + ".html");
            long tables = html.split("<table", -1).length - 1L;
            long wrapped = html.split("table-responsive", -1).length - 1L;
            assertThat(wrapped).as(f).isGreaterThanOrEqualTo(tables);
        }
    }
}
