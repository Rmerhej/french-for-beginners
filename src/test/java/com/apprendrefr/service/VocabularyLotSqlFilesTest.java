package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** Contrôle des scripts SQL de leçons de vocabulaire (frenchdb_9_vocab_*.sql) : tailles des champs, doublons, protection contre la ré-exécution. */
class VocabularyLotSqlFilesTest {

    private static final String Q = "'((?:[^']|'')*)'";
    private static final Pattern WORD = Pattern.compile(
            "SELECT NULL, " + Q + ", " + Q + ", '(/images/vocab/[a-z0-9-]+\\.svg)', " + Q + ", l\\.`id`, " + Q + ", '' FROM `lessons` l");
    private static final Pattern LESSON = Pattern.compile(
            "SELECT NULL, '', '', NOW\\(6\\), NULL, " + Q + ", " + Q + " FROM DUAL");

    @Test
    void everyVocabularyLotIsWellFormed() throws IOException {
        String sql = "";
        try (Stream<Path> stream = Files.list(Path.of("init-db"))) {
            for (Path file : stream.filter(p -> p.getFileName().toString().startsWith("frenchdb_9_vocab_"))
                    .filter(p -> p.toString().endsWith(".sql")).sorted().toList()) {
                sql += Files.readString(file) + "\n";
            }
        }
        Matcher lessons = LESSON.matcher(sql);
        int lessonCount = 0;
        while (lessons.find()) {
            assertTrue(lessons.group(2).length() <= 150, "Titre trop long : " + lessons.group(2));
            assertTrue(Set.of("A1", "A2", "B1", "B2").contains(lessons.group(1)), "Niveau inconnu : " + lessons.group(1));
            lessonCount++;
        }
        assertTrue(lessonCount >= 4, "Leçons trouvées : " + lessonCount);

        Matcher words = WORD.matcher(sql);
        Set<String> seen = new HashSet<>();
        int wordCount = 0;
        while (words.find()) {
            String english = words.group(1);
            String french = words.group(2);
            String image = words.group(3);
            String example = words.group(5);
            assertTrue(Files.exists(Path.of("src/main/resources/static" + image)), "Image manquante : " + image);
            assertTrue(!french.isBlank() && french.length() <= 100, "Mot français invalide : " + french);
            assertTrue(!english.isBlank() && english.length() <= 100, "Traduction invalide : " + english);
            assertTrue(words.group(4).length() <= 100, "Prononciation trop longue : " + french);
            assertTrue(example.length() <= 500 && example.endsWith("."), "Exemple invalide : " + french);
            wordCount++;
        }
        assertTrue(wordCount >= 72, "Mots trouvés : " + wordCount);
        assertEquals(wordCount, sql.split("x\\.`french_word`", -1).length - 1, "Chaque mot doit être protégé contre les doublons");
        assertEquals(lessonCount, sql.split("WHERE NOT EXISTS \\(SELECT 1 FROM `lessons`", -1).length - 1, "Chaque leçon doit être protégée contre les doublons");
    }
}
