package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** Contrôle du script SQL des 60 questions du test de positionnement (frenchdb_9_test_positionnement.sql). */
class PlacementTestSqlFileTest {

    private static final String Q = "'((?:[^']|'')*)'";
    private static final Pattern UPDATE = Pattern.compile(
            "UPDATE `exercises` SET `correct_answer` = '([A-D])', `explanation` = " + Q
                    + ", `lesson_title` = 'Test', `optiona` = " + Q + ", `optionb` = " + Q
                    + ", `optionc` = " + Q + ", `optiond` = " + Q + ", `question` = " + Q
                    + " WHERE `id` = (\\d+) AND `lesson_title` LIKE 'Test%';");

    @Test
    void sixtyQuestionsAreWellFormed() throws IOException {
        String sql = Files.readString(Path.of("init-db", "frenchdb_9_test_positionnement.sql"));
        Matcher m = UPDATE.matcher(sql);
        int count = 0;
        Map<String, Integer> letters = new TreeMap<>();
        while (m.find()) {
            String answer = m.group(1);
            String explanation = m.group(2);
            List<String> options = List.of(m.group(3), m.group(4), m.group(5), m.group(6));
            String question = m.group(7);
            int id = Integer.parseInt(m.group(8));
            assertEquals(424 + count, id, "Les questions doivent suivre les numéros 424 à 483");
            assertTrue(question.length() > 10 && question.length() <= 255, "Question invalide : " + id);
            assertTrue(explanation.length() > 20 && explanation.length() <= 1000, "Explication invalide : " + id);
            assertEquals(4, new HashSet<>(options).size(), "Quatre propositions différentes : " + id);
            for (String option : options) {
                assertFalse(option.isBlank(), "Proposition vide : " + id);
                assertTrue(option.length() <= 255, "Proposition trop longue : " + id);
            }
            // le niveau ne doit pas être nommé dans les textes montrés aux apprenants
            String all = (question + explanation + String.join(" ", options)).toUpperCase(Locale.ROOT);
            assertFalse(all.contains("CECR"), "Le cadre européen ne doit pas être cité : " + id);
            letters.merge(answer, 1, Integer::sum);
            count++;
        }
        assertEquals(60, count, "Le test comporte 60 questions");
        // bonnes réponses réparties à égalité : impossible de gagner en répondant toujours la même lettre
        assertEquals(Map.of("A", 15, "B", 15, "C", 15, "D", 15), letters);
        // une seule instruction UPDATE par question, aucune autre table touchée
        assertEquals(60, sql.split("UPDATE `exercises`", -1).length - 1);
        assertFalse(sql.toUpperCase(Locale.ROOT).contains("DELETE"), "Aucune suppression attendue");
        Set<String> tables = new HashSet<>();
        Matcher t = Pattern.compile("(?i)(UPDATE|INSERT INTO|DROP TABLE|ALTER TABLE)\\s+`(\\w+)`").matcher(sql);
        while (t.find()) {
            tables.add(t.group(2));
        }
        assertEquals(Set.of("exercises"), tables);
    }
}
