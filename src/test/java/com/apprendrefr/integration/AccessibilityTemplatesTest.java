package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Garde-fous d'accessibilité (les pages d'administration sont exemptées de la règle « une zone principale + un titre ») sur les gabarits : ces défauts ont été corrigés une fois,
 * ce test empêche qu'ils reviennent quand on ajoute une page.
 */
class AccessibilityTemplatesTest {

    private static final Path TEMPLATES = Path.of("src/main/resources/templates");

    private static List<Path> templates() throws IOException {
        try (Stream<Path> s = Files.walk(TEMPLATES)) {
            return s.filter(p -> p.toString().endsWith(".html")).sorted().toList();
        }
    }

    private static boolean isPage(Path p) {
        String rel = TEMPLATES.relativize(p).toString().replace('\\', '/');
        return !rel.startsWith("fragments/");
    }

    @Test
    void zoomIsNeverBlocked() throws IOException {
        for (Path p : templates()) {
            assertThat(Files.readString(p)).as("%s : le zoom ne doit pas être bloqué", p)
                    .doesNotContain("user-scalable=no")
                    .doesNotContain("maximum-scale");
        }
    }

    @Test
    void linksOpeningANewTabHaveNoopener() throws IOException {
        Pattern link = Pattern.compile("<a\\b[^>]*target=\"_blank\"[^>]*>");
        for (Path p : templates()) {
            Matcher m = link.matcher(Files.readString(p));
            while (m.find()) {
                assertThat(m.group()).as("%s : lien avec target=_blank sans rel=noopener", p).contains("noopener");
            }
        }
    }

    @Test
    void everyTableHeaderCellSaysWhatItLabels() throws IOException {
        Pattern th = Pattern.compile("<th(?=[\\s>])[^>]*>");
        for (Path p : templates()) {
            Matcher m = th.matcher(Files.readString(p));
            while (m.find()) {
                assertThat(m.group()).as("%s : <th> sans scope", p).contains("scope=");
            }
        }
    }

    @Test
    void decorativeIconsAreHiddenFromScreenReaders() throws IOException {
        Pattern icon = Pattern.compile("<i class=\"bi [^>]*>");
        for (Path p : templates()) {
            Matcher m = icon.matcher(Files.readString(p));
            while (m.find()) {
                assertThat(m.group()).as("%s : icône sans aria-hidden", p).contains("aria-hidden");
            }
        }
    }

    @Test
    void everyFieldsetHasALegend() throws IOException {
        for (Path p : templates()) {
            String html = Files.readString(p);
            assertThat(count(html, "<legend")).as("%s : <fieldset> sans <legend>", p)
                    .isGreaterThanOrEqualTo(count(html, "<fieldset"));
        }
    }

    @Test
    void qcmQuestionsWithoutFieldsetAreNamedRadioGroups() throws IOException {
        for (Path p : templates()) {
            String html = Files.readString(p);
            if (html.contains("<div class=\"options mb-3\"") && !html.contains("<legend")) {
                assertThat(html).as("%s : groupe de réponses sans nom", p).contains("role=\"radiogroup\"");
            }
        }
    }

    @Test
    void everyPublicPageHasExactlyOneMainAndAMainTitle() throws IOException {
        List<String> problems = new ArrayList<>();
        for (Path p : templates()) {
            if (!isPage(p)) continue;
            String rel = TEMPLATES.relativize(p).toString().replace('\\', '/');
            String html = Files.readString(p);
            long mains = count(html, "<main") + count(html, "role=\"main\"");
            if (!rel.startsWith("admin/") && mains != 1) problems.add(rel + " : " + mains + " zone(s) principale(s)");
            if (count(html, "<main") != count(html, "</main>")) problems.add(rel + " : <main> mal fermé");
            if (html.contains("<main th:each")) problems.add(rel + " : <main> répété");
            if (!rel.startsWith("admin/") && !html.contains("<h1")) problems.add(rel + " : pas de <h1>");
        }
        assertThat(problems).as("pages à corriger").isEmpty();
    }

    private static long count(String text, String part) {
        return text.split(Pattern.quote(part), -1).length - 1L;
    }
}
