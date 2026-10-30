package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Pages de leçon : bandeau aux couleurs du site, largeur de lecture confortable,
 * et tableaux qui défilent au lieu de faire déborder la page sur téléphone.
 */
class LessonLayoutTest {

    private static final Path RESOURCES = Path.of("src/main/resources");

    private static List<Path> lessonPages() throws IOException {
        try (Stream<Path> s = Files.list(RESOURCES.resolve("templates"))) {
            return s.filter(p -> p.toString().endsWith(".html"))
                    .filter(p -> !p.endsWith("index.html"))
                    .filter(p -> {
                        try {
                            return Files.readString(p).contains("class=\"hero");
                        } catch (IOException e) {
                            throw new IllegalStateException(e);
                        }
                    })
                    .toList();
        }
    }

    private static long count(String text, String part) {
        return text.split(java.util.regex.Pattern.quote(part), -1).length - 1L;
    }

    @Test
    void lessonPages_wereFound() throws IOException {
        assertThat(lessonPages().size()).isGreaterThan(50);
    }

    @Test
    void everyTable_ofALessonPage_scrollsInsideATableResponsiveBlock() throws IOException {
        for (Path p : lessonPages()) {
            String html = Files.readString(p);
            assertThat(count(html, "<table"))
                    .as("%s : chaque <table> doit être dans un bloc table-responsive", p)
                    .isLessThanOrEqualTo(count(html, "class=\"table-responsive"));
        }
    }

    @Test
    void heroBanner_usesTheBrandColors_notTheOldPurple() throws IOException {
        String theme = Files.readString(RESOURCES.resolve("static/css/theme.css"));
        assertThat(theme).contains(".hero:not(.bg-primary)").contains("max-width: 880px");
        try (Stream<Path> s = Files.list(RESOURCES.resolve("static/css"))) {
            for (Path p : s.filter(f -> f.toString().endsWith(".css")).toList()) {
                assertThat(Files.readString(p).toLowerCase())
                        .as("ancien violet dans %s", p)
                        .doesNotContain("764ba2").doesNotContain("667eea");
            }
        }
    }

    @Test
    void cardPages_keepTheFullContainerWidth() throws IOException {
        String css = Files.readString(RESOURCES.resolve("static/css/lesson-hero-cards.css"));
        assertThat(css).contains("max-width: 960px").contains("max-width: 1140px").contains("max-width: 1320px");
    }
}
