package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.assertj.core.api.Assertions.assertThat;

/** Accueil et « Toutes les leçons » : couleurs de la marque, styles dans les fichiers CSS, cartes immobiles. */
class HomeAndLessonsStyleTest {

    private static final Path RESOURCES = Path.of("src/main/resources");

    private static String read(String f) throws IOException {
        return Files.readString(RESOURCES.resolve(f));
    }

    @Test
    void homePage_hasNoOldBootstrapBlueOrPurple_andNoDecorativeBreaks() throws IOException {
        String css = read("static/css/index-page.css").toLowerCase();
        assertThat(css).doesNotContain("#0d6efd").doesNotContain("#6f42c1").doesNotContain("#0a58ca");
        String html = read("templates/index.html");
        assertThat(html).doesNotContain("<br>").doesNotContain("<br/>");
        assertThat(html).doesNotContain("width: 36px");
        assertThat(html).contains("parcours-number");
    }

    @Test
    void homePage_keepsItsContent() throws IOException {
        String html = read("templates/index.html");
        assertThat(html).contains("continuer-parcours").contains("Projet bénévole")
                .contains("Passer le test maintenant").contains("Choisissez votre parcours")
                .contains("@{/niveauDebutant}").contains("@{/niveauConsolidation}")
                .contains("@{/niveauApprofondissement}");
    }

    @Test
    void lessonCards_doNotMove_andHaveNoInlineStyle() throws IOException {
        assertThat(read("static/css/lessons-page.css")).doesNotContain("translateY").contains("overflow: hidden");
        String html = read("templates/lessons.html");
        assertThat(html).doesNotContain("style=\"").contains("ffb-badge-soft").contains("lesson-card-img");
    }

    @Test
    void darkMode_textColorsAreReadable() throws IOException {
        String theme = read("static/css/theme.css");
        assertThat(theme).contains("[data-bs-theme=\"dark\"] .text-danger")
                .contains("[data-bs-theme=\"dark\"] .text-primary");
    }
}
