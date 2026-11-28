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
 * Thème « Au Bureau » (/themes/Bureau) : la migration V9 remet les QCM et les quiz d'origine
 * (retrouvés vides sur le serveur) et ajoute des QCM sur le dialogue.
 */
class BureauSqlFileTest {

    private static final String Q = "'((?:[^']|'')*)'";
    private static final Pattern QCM = Pattern.compile(
            "SELECT " + Q + ", " + Q + ", 'Au Bureau', " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + " FROM DUAL");
    private static final Pattern QUIZ = Pattern.compile(
            "SELECT " + Q + ", '', " + Q + ", " + Q + ", " + Q + ", NULL FROM DUAL");

    private static String read() throws IOException {
        return Files.readString(Path.of("src/main/resources/db/migration", "V9__theme_bureau_qcm_quiz.sql"));
    }

    private static int count(String text, String needle) {
        int n = 0;
        for (int i = text.indexOf(needle); i >= 0; i = text.indexOf(needle, i + needle.length())) {
            n++;
        }
        return n;
    }

    /** Sur la page d'un thème, le bouton « Vérifier » compare la case cochée (A, B, C ou D) à la bonne réponse. */
    @Test
    void qcmAnswersAreLettersOfFourDistinctOptions() throws IOException {
        Matcher m = QCM.matcher(read());
        int checked = 0;
        while (m.find()) {
            String answer = m.group(1);
            String question = m.group(7);
            assertTrue(answer.matches("[ABCD]"), "La bonne réponse doit être une lettre A, B, C ou D : " + question);
            List<String> options = List.of(m.group(3), m.group(4), m.group(5), m.group(6));
            assertEquals(4, options.stream().distinct().count(), "Options en double : " + question);
            assertTrue(!options.get("ABCD".indexOf(answer)).isBlank(), "Option vide : " + question);
            checked++;
        }
        assertEquals(10, checked, "Dix QCM pour le thème");
    }

    @Test
    void quizAreWellFormed() throws IOException {
        Matcher m = QUIZ.matcher(read());
        int quizzes = 0;
        while (m.find()) {
            List<String> answers = Arrays.asList(m.group(1).split(",", -1));
            List<String> words = Arrays.asList(m.group(4).split(",", -1));
            String sentence = m.group(2);
            String title = m.group(3);
            assertTrue(title.contains("Au Bureau"), "Le titre doit contenir le nom du thème : " + title);
            assertEquals(answers.size(), count(sentence, "____"), "Cases à remplir et réponses différentes : " + title);
            assertTrue(words.containsAll(answers), "Une réponse manque dans la liste de mots : " + title);
            quizzes++;
        }
        assertEquals(9, quizzes, "Neuf quiz pour le thème");
    }

    @Test
    void scriptCanBeRunSeveralTimes() throws IOException {
        String sql = read();
        assertEquals(count(sql, "FROM DUAL"), count(sql, "WHERE NOT EXISTS (SELECT 1 FROM `"),
                "Chaque ajout doit être protégé contre les doublons");
    }
}
