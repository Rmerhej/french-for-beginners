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
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * Accueil court : l'accueil ne montre que trois cartes de parcours ; le détail « Ce que contient ce parcours »
 * est sur la page de chaque niveau. Le mode sombre passe par les variables de couleur du site.
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class HomeLayoutTest {

    private static final Path RESOURCES = Path.of("src/main/resources");

    @Autowired
    private MockMvc mockMvc;

    private static String read(String file) throws IOException {
        return Files.readString(RESOURCES.resolve(file));
    }

    @Test
    void homeIsShort_detailsAreOnTheLevelPages() throws Exception {
        String home = read("templates/index.html");
        assertThat(home).doesNotContain("Ce que contient");
        for (String page : new String[] {"niveauDebutant", "niveauConsolidation", "niveauApprofondissement"}) {
            String html = read("templates/" + page + ".html");
            assertThat(html).as(page).contains("Ce que contient ce parcours").contains("Grammaire &amp; Conjugaison")
                    .contains("/css/niveau-contenu.css");
        }
        assertThat(read("templates/niveauDebutant.html")).contains("audios, chiffres").doesNotContain("sons, chiffres");
        assertThat(home).contains("Audios, chiffres").doesNotContain("Sons, chiffres");
        // Grammaire et conjugaison sont dans les trois niveaux : l'accueil l'annonce sur chaque carte
        assertThat(home.split("grammaire et conjugaison|Grammaire et conjugaison", -1).length - 1).isGreaterThanOrEqualTo(3);
    }

    @Test
    void anonymousHomeEncouragesAccountsOnce() throws Exception {
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Créez votre compte gratuit")))
                .andExpect(content().string(not(containsString("Créer mon compte gratuit"))))
                .andExpect(content().string(not(containsString("sans compte"))));
    }

    @Test
    void levelCardsUseThemeVariables_soDarkModeWorks() throws IOException {
        String css = read("static/css/index-page.css");
        assertThat(css).contains(".level-card {").contains("var(--ffb-surface)").contains("var(--bs-body-color)");
        assertThat(css).doesNotContain("background: #fff").doesNotContain("background-color: #ffffff");
        assertThat(read("templates/fragments/footer.html")).contains("dark-mode-prompt.js");
    }
}
