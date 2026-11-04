package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Contrôle du script SQL du QCM général et du quiz général de l'examen civique
 * (init-db/frenchdb_9_examen_civique.sql) : une erreur de saisie se verrait en classe.
 */
class ExamenCiviqueSqlFileTest {

    private static final String Q = "'((?:[^']|'')*)'";
    private static final Pattern QCM_ROW = Pattern.compile(
            "SELECT " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + ", 'QCM' FROM DUAL");
    private static final Pattern QUIZ_ROW = Pattern.compile(
            "SELECT " + Q + ", '', " + Q + ", " + Q + ", " + Q + ", NULL FROM DUAL");

    /** Les QCM et quiz des 5 modules sont retrouvés par ces mots-clés (LaFranceController) : le général ne doit jamais les contenir. */
    private static final List<String> MODULE_KEYWORDS = List.of(
            "principes et valeurs", "système institutionnel et politique", "systeme institutionnel et politique",
            "droits et devoirs", "histoire géographie et culture", "histoire geographie et culture",
            "vivre dans la société française", "vivre dans la societe française");

    private static String unescape(String sql) {
        return sql.replace("''", "'");
    }

    private static String sql() throws IOException {
        return Files.readString(Path.of("init-db/frenchdb_9_examen_civique.sql"));
    }

    @Test
    void qcmGeneralHasFortyQuestionsWithOneAnswerAmongFourDistinctOptions() throws IOException {
        String sql = sql();
        Matcher m = QCM_ROW.matcher(sql);
        Map<String, Integer> byLetter = new HashMap<>();
        Set<String> questions = new HashSet<>();
        int checked = 0;
        while (m.find()) {
            String letter = unescape(m.group(1));
            String explanation = unescape(m.group(2));
            String title = unescape(m.group(3));
            List<String> options = List.of(unescape(m.group(4)), unescape(m.group(5)),
                    unescape(m.group(6)), unescape(m.group(7)));
            String question = unescape(m.group(8));

            assertTrue(List.of("A", "B", "C", "D").contains(letter), "La réponse doit être une lettre A à D : " + question);
            assertEquals("Examen civique - QCM général", title);
            assertEquals(4, new HashSet<>(options).size(), "Options en double : " + question);
            assertTrue(options.stream().noneMatch(String::isBlank), "Option vide : " + question);
            assertTrue(options.stream().allMatch(o -> o.length() <= 255), "Option trop longue : " + question);
            assertTrue(explanation.length() <= 255, "Explication trop longue : " + question);
            assertTrue(questions.add(question), "Question en double : " + question);
            byLetter.merge(letter, 1, Integer::sum);
            checked++;
        }
        assertEquals(40, checked, "Le QCM général doit compter 40 questions, comme l'examen");
        for (String letter : List.of("A", "B", "C", "D")) {
            assertTrue(byLetter.getOrDefault(letter, 0) >= 8,
                    "La bonne réponse ne doit pas être trop souvent à la même place : " + byLetter);
        }
    }

    @Test
    void quizGeneralHasAsManyAnswersAsBlanks_andAnswersAreInTheWordList() throws IOException {
        Matcher m = QUIZ_ROW.matcher(sql());
        Set<String> sentences = new HashSet<>();
        int checked = 0;
        while (m.find()) {
            String answers = unescape(m.group(1));
            String sentence = unescape(m.group(2));
            String title = unescape(m.group(3));
            Set<String> words = new HashSet<>(Arrays.asList(unescape(m.group(4)).split(",")));

            int blanks = sentence.split("____", -1).length - 1;
            String[] expected = answers.split(",");
            assertEquals(blanks, expected.length, "Nombre de cases et de réponses différent : " + sentence);
            for (String answer : expected) {
                assertTrue(words.contains(answer), "Réponse absente des mots proposés (" + answer + ") : " + sentence);
            }
            assertTrue(words.size() > expected.length, "Il faut au moins un mot en trop : " + sentence);
            assertEquals("Examen civique - Quiz général", title);
            assertTrue(sentences.add(sentence), "Phrase en double : " + sentence);
            checked++;
        }
        assertEquals(15, checked, "Le quiz général doit compter 15 phrases (3 par module)");
    }

    @Test
    void everyInsertIsProtectedAgainstDuplicates_andTitlesDoNotCollideWithTheModules() throws IOException {
        String sql = sql();
        int inserts = sql.split("INSERT INTO", -1).length - 1;
        assertEquals(55, inserts);
        assertEquals(inserts, sql.split("NOT EXISTS", -1).length - 1, "Chaque ligne doit être protégée contre les doublons");

        for (String title : List.of("Examen civique - QCM général", "Examen civique - Quiz général")) {
            String lower = title.toLowerCase(Locale.ROOT);
            for (String keyword : MODULE_KEYWORDS) {
                assertFalse(lower.contains(keyword), "Le titre « " + title + " » apparaîtrait dans le module « " + keyword + " »");
            }
        }
    }
}
