package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.assertj.core.api.Assertions.assertThat;

/** Carte « Test de positionnement » de l'accueil : la pastille et le bouton ont un fond blanc lisible sur le bleu. */
class PlacementTestCardStyleTest {

    private static String read(String file) throws IOException {
        return Files.readString(Path.of("src/main/resources").resolve(file));
    }

    @Test
    void badgeAndButtonHaveTheirOwnBackground() throws IOException {
        String html = read("templates/index.html");
        assertThat(html).contains("test-card-badge").contains("btn btn-light test-card-cta");
        String css = read("static/css/index-page.css");
        assertThat(css).contains(".test-card .test-card-badge").contains("background-color: #fff")
                .contains(".test-card .test-card-cta").contains("--bs-btn-bg: #fff");
    }

    @Test
    void iconFontIsNotPreloaded_becauseTheCssUsesAnotherUrl() throws IOException {
        assertThat(read("templates/fragments/assets.html")).doesNotContain("rel=\"preload\" th:href=\"@{/vendor/bootstrap-icons");
    }
}
