package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Garde-fou « pas de gestionnaires d'événements en ligne ».
 *
 * Les attributs onclick="...", onsubmit="..." (et leurs versions th:onclick) ont été remplacés par des attributs
 * data-click / data-confirm, traités par js/events.js. Ce test empêche leur retour dans une nouvelle page, et vérifie
 * que chaque action utilisée par les pages est bien autorisée dans events.js.
 */
class InlineHandlersTest {

    private static final Path TEMPLATES = Path.of("src/main/resources/templates");
    private static final Path EVENTS_JS = Path.of("src/main/resources/static/js/events.js");

    /** Un attribut d'événement : espace, éventuellement « th: », puis on + lettres + « = » et un guillemet. */
    private static final Pattern EVENT_ATTRIBUTE =
            Pattern.compile("\\s(?:th:)?on[a-z]+\\s*=\\s*[\"']", Pattern.CASE_INSENSITIVE);

    private static final Pattern JAVASCRIPT_URL =
            Pattern.compile("(?:href|src|action)\\s*=\\s*[\"']\\s*javascript:", Pattern.CASE_INSENSITIVE);

    private static final Pattern DATA_CLICK = Pattern.compile("data-click=\"(\\w+)\"");

    /** Une balise <script> sans src (th:src compris) et qui n'est pas un bloc de données JSON-LD. */
    private static final Pattern INLINE_SCRIPT =
            Pattern.compile("<script\\b(?![^>]*\\bsrc\\s*=)(?![^>]*ld\\+json)[^>]*>", Pattern.CASE_INSENSITIVE);

    private static List<Path> templates() throws IOException {
        try (Stream<Path> s = Files.walk(TEMPLATES)) {
            return s.filter(p -> p.toString().endsWith(".html")).sorted().toList();
        }
    }

    @Test
    void noInlineEventAttributesInTemplates() throws IOException {
        List<String> found = new ArrayList<>();
        for (Path p : templates()) {
            Matcher m = EVENT_ATTRIBUTE.matcher(Files.readString(p));
            while (m.find()) {
                found.add(p + " : " + m.group().trim());
            }
        }
        assertThat(found)
                .as("Pas de onclick/onsubmit… dans les pages : utiliser data-click ou data-confirm (voir js/events.js)")
                .isEmpty();
    }

    @Test
    void noInlineScriptBlocksInTemplates() throws IOException {
        List<String> found = new ArrayList<>();
        for (Path p : templates()) {
            Matcher m = INLINE_SCRIPT.matcher(Files.readString(p));
            while (m.find()) {
                found.add(p + " : " + m.group());
            }
        }
        assertThat(found)
                .as("Pas de <script> écrit dans les pages : placer le code dans static/js et le charger avec th:src")
                .isEmpty();
    }

    @Test
    void loginStateMarkerReplacesTheInlineScript() throws IOException {
        assertThat(Files.readString(TEMPLATES.resolve("fragments/footer.html")))
                .contains("id=\"ffb-auth\"").contains("sec:authorize=\"isAuthenticated()\"")
                .doesNotContain("FFB_AUTH");
        assertThat(Files.readString(Path.of("src/main/resources/static/js/score-sender.js")))
                .contains("getElementById('ffb-auth')").doesNotContain("FFB_AUTH");
    }

    @Test
    void scriptsMovedOutOfThePagesAreLoadedWhereTheyWereWritten() throws IOException {
        String footer = Files.readString(TEMPLATES.resolve("fragments/footer.html"));
        assertThat(footer).contains("/js/theme-toggle.js");
        assertThat(Files.readString(TEMPLATES.resolve("fragments/back-to-top.html"))).contains("/js/back-to-top.js");
        assertThat(Files.readString(TEMPLATES.resolve("installer.html"))).contains("/js/installer.js");
        assertThat(Files.readString(TEMPLATES.resolve("conjugueur.html"))).contains("/js/conjugueur-listen.js");
        assertThat(Files.readString(TEMPLATES.resolve("evaluation.html"))).contains("/js/evaluation.js");
        String quiz = Files.readString(TEMPLATES.resolve("quiz.html"));
        assertThat(quiz).contains("/js/quiz-simple.js").contains("id=\"quiz-words\"").contains("id=\"quiz-answers\"")
                .doesNotContain("th:inline");
        for (String js : List.of("theme-toggle", "back-to-top", "installer", "conjugueur-listen", "evaluation", "quiz-simple")) {
            assertThat(Path.of("src/main/resources/static/js/" + js + ".js")).exists();
        }
    }

    @Test
    void noJavascriptUrlsInTemplates() throws IOException {
        for (Path p : templates()) {
            assertThat(JAVASCRIPT_URL.matcher(Files.readString(p)).find())
                    .as("%s : pas d'adresse « javascript: »", p)
                    .isFalse();
        }
    }

    @Test
    void everyDataClickActionIsAllowedInEventsJs() throws IOException {
        String events = Files.readString(EVENTS_JS);
        Matcher list = Pattern.compile("ACTIONS\\s*=\\s*\\[(.*?)]", Pattern.DOTALL).matcher(events);
        assertThat(list.find()).as("la liste ACTIONS existe dans events.js").isTrue();
        Set<String> allowed = new HashSet<>();
        Matcher names = Pattern.compile("'(\\w+)'").matcher(list.group(1));
        while (names.find()) {
            allowed.add(names.group(1));
        }
        assertThat(allowed).isNotEmpty();

        Set<String> used = new HashSet<>();
        for (Path p : templates()) {
            Matcher m = DATA_CLICK.matcher(Files.readString(p));
            while (m.find()) {
                used.add(m.group(1));
            }
        }
        assertThat(used).as("data-click utilisés par les pages").isNotEmpty();
        assertThat(allowed).as("toute action utilisée doit être autorisée dans events.js").containsAll(used);
    }

    @Test
    void footerLoadsEventsScriptAndItExists() throws IOException {
        assertThat(Files.readString(TEMPLATES.resolve("fragments/footer.html")))
                .as("le pied de page, présent sur toutes les pages, charge events.js")
                .contains("/js/events.js");
        assertThat(EVENTS_JS).exists();
    }

    @Test
    void confirmMessagesAreNotEmpty() throws IOException {
        for (Path p : templates()) {
            assertThat(Files.readString(p))
                    .as("%s : un data-confirm vide ne demanderait rien", p)
                    .doesNotContain("data-confirm=\"\"");
        }
    }
}
