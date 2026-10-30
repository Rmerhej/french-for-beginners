package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.assertj.core.api.Assertions.assertThat;

/** Cartes de la page « Prononciation » : style dans les fichiers CSS, bouton lecture de 48 px, carte immobile. */
class PronunciationStyleTest {

    private static final Path RESOURCES = Path.of("src/main/resources");

    @Test
    void template_hasNoInlineSizing_andKeepsTheHooksUsedByScripts() throws IOException {
        String html = Files.readString(RESOURCES.resolve("templates/prononciation.html"));
        assertThat(html).doesNotContain("style=\"width: 42px").doesNotContain("style=\"border-radius");
        assertThat(html).contains("ffb-icon-chip").contains("prononciation-exemple");
        // utilisés par audio.js et say.js
        assertThat(html).contains("btn-play").contains("btn-say").contains("<audio class=\"d-none\">");
    }

    @Test
    void cardStyle_hasBigPlayButton_andDoesNotMoveOnHover() throws IOException {
        String css = Files.readString(RESOURCES.resolve("static/css/prononciation-page.css"));
        assertThat(css).contains("width: 48px").contains("height: 48px");
        assertThat(css).doesNotContain("translateY");
        assertThat(Files.readString(RESOURCES.resolve("static/css/theme.css"))).contains(".ffb-icon-chip");
    }

    @Test
    void audioScript_usesTheSameIconSizeAsTheTemplate() throws IOException {
        String js = Files.readString(RESOURCES.resolve("static/js/audio.js"));
        assertThat(js).doesNotContain("fs-3").contains("bi-play-fill fs-4");
    }
}
