package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Cuisine de restaurant : deux leçons de vocabulaire (ustensiles, gestes) et deux thèmes
 * (« Dans la cuisine », « Cuisiner un plat »), avec QCM et traductions zh, ko, pt, es.
 */
class Lot6CuisineSqlFilesTest {

    private static final String[] VOCAB_TITLES = {"LES USTENSILES DE CUISINE", "LES GESTES DE CUISINE"};
    private static final String[] THEME_QCM_TITLES = {"DANS LA CUISINE", "CUISINER UN PLAT"};
    private static final String[] THEMES = {"Dans la cuisine", "Cuisiner"};

    private static String read(String name) throws IOException {
        return Files.readString(Path.of("init-db", name));
    }

    private static int count(String text, String needle) {
        int n = 0;
        for (int i = text.indexOf(needle); i >= 0; i = text.indexOf(needle, i + needle.length())) {
            n++;
        }
        return n;
    }

    @Test
    void vocabularyLessonsHaveWordsAndQcm() throws IOException {
        String vocab = read("frenchdb_9_vocab_lot6.sql");
        String qcm = read("frenchdb_9_qcm_vocabulaire_8.sql");
        for (String title : VOCAB_TITLES) {
            assertEquals(1, count(vocab, "'A1', '" + title + "' FROM DUAL"), "Leçon manquante : " + title);
            assertTrue(count(vocab, "SELECT MIN(`id`) FROM `lessons` WHERE `title` = '" + title + "') AND NOT EXISTS") >= 15,
                    "Trop peu de mots : " + title);
            assertTrue(count(qcm, "WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = '" + title + "'") >= 10,
                    "Trop peu de QCM : " + title);
        }
    }

    @Test
    void everyWordIsTranslatedInFourLanguages() throws IOException {
        String vocab = read("frenchdb_9_vocab_lot6.sql");
        String translations = read("frenchdb_9_traductions_lot6.sql");
        int words = count(vocab, "AND NOT EXISTS (SELECT 1 FROM `vocabularies` x");
        assertEquals(words * 4, count(translations, "SELECT 'VOCAB_WORD'"));
        assertEquals(words * 4, count(translations, "SELECT 'VOCAB_SENTENCE'"));
        assertTrue(translations.contains("INSERT IGNORE"), "Le script doit pouvoir être relancé");
    }

    @Test
    void themesHaveDialogueTranslationsAndQcm() throws IOException {
        String themes = read("frenchdb_9_themes_cuisine.sql");
        String qcm = read("frenchdb_9_themes_qcm_cuisine.sql");
        for (String nom : THEMES) {
            assertEquals(1, count(themes, "WHERE NOT EXISTS (SELECT 1 FROM `themes` WHERE `nom` = '" + nom + "')"),
                    "Thème manquant ou non protégé contre les doublons : " + nom);
        }
        for (String lang : new String[] {"zh", "ko", "pt", "es"}) {
            assertEquals(2, count(themes, "SELECT 'THEME_DIALOGUE', t.`id`, '" + lang + "', "),
                    "Traduction du dialogue manquante en " + lang);
        }
        assertEquals(8, count(themes, "SELECT 'THEME_DIALOGUE'"), "Deux thèmes x quatre langues");
        assertTrue(themes.contains("NULL FROM DUAL"), "Pas de MP3 : la voix du navigateur prend le relais");
        for (String title : THEME_QCM_TITLES) {
            assertTrue(count(qcm, "WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = '" + title + "'") >= 10,
                    "Trop peu de QCM : " + title);
        }
    }

    private static final String Q = "'((?:[^']|'')*)'";
    private static final Pattern QUIZ = Pattern.compile(
            "SELECT " + Q + ", '', " + Q + ", " + Q + ", " + Q + ", NULL FROM DUAL");

    private static final Pattern THEME_QCM = Pattern.compile(
            "SELECT " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + " FROM DUAL");

    /** Sur la page d'un thème, le bouton « Vérifier » compare la case cochée (A, B, C ou D) à la bonne réponse. */
    @Test
    void themeQcmAnswersAreLettersOfFourDistinctOptions() throws IOException {
        Matcher m = THEME_QCM.matcher(read("frenchdb_9_themes_qcm_cuisine.sql"));
        int checked = 0;
        while (m.find()) {
            String answer = m.group(1);
            String question = m.group(8);
            assertTrue(answer.matches("[ABCD]"), "La bonne réponse doit être une lettre A, B, C ou D : " + question);
            List<String> options = List.of(m.group(4), m.group(5), m.group(6), m.group(7));
            assertEquals(4, options.stream().distinct().count(), "Options en double : " + question);
            assertTrue(!options.get("ABCD".indexOf(answer)).isBlank(), "Option vide : " + question);
            checked++;
        }
        assertEquals(20, checked, "Dix QCM par thème");
    }

    @Test
    void everyThemeHasFourWellFormedQuiz() throws IOException {
        String sql = read("frenchdb_9_quiz_themes_cuisine.sql");
        Matcher m = QUIZ.matcher(sql);
        int quizzes = 0;
        int dansLaCuisine = 0;
        int cuisinerUnPlat = 0;
        while (m.find()) {
            List<String> answers = Arrays.asList(m.group(1).split(",", -1));
            List<String> words = Arrays.asList(m.group(4).split(",", -1));
            String sentence = m.group(2);
            String title = m.group(3);
            assertEquals(answers.size(), count(sentence, "____"), "Cases à remplir et réponses différentes : " + title);
            assertTrue(words.containsAll(answers), "Une réponse manque dans la liste de mots : " + title);
            assertTrue(words.size() >= answers.size(), "Pas assez de mots : " + title);
            assertTrue(title.contains("Dans la cuisine") || title.contains("Cuisiner"),
                    "Le titre doit contenir le nom du thème : " + title);
            if (title.contains("Dans la cuisine")) {
                dansLaCuisine++;
            } else {
                cuisinerUnPlat++;
            }
            quizzes++;
        }
        assertEquals(8, quizzes, "Quatre quiz par thème");
        assertEquals(4, dansLaCuisine);
        assertEquals(4, cuisinerUnPlat);
        assertEquals(quizzes, count(sql, "WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` ="),
                "Chaque quiz doit être protégé contre les doublons");
    }
}
