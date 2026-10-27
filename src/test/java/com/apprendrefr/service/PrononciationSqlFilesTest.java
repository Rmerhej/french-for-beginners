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

/** Contrôle des scripts SQL de cartes de prononciation (frenchdb_9_prononciation_*.sql). */
class PrononciationSqlFilesTest {

    private static final String Q = "'((?:[^']|'')*)'";
    private static final Pattern CARD = Pattern.compile("SELECT NULL, " + Q + ", " + Q + " FROM DUAL");

    @Test
    void everyPronunciationCardIsWellFormed() throws IOException {
        String sql = "";
        try (Stream<Path> stream = Files.list(Path.of("init-db"))) {
            for (Path file : stream.filter(p -> p.getFileName().toString().startsWith("frenchdb_9_prononciation_"))
                    .filter(p -> p.toString().endsWith(".sql")).sorted().toList()) {
                sql += Files.readString(file) + "\n";
            }
        }
        Matcher m = CARD.matcher(sql);
        Set<String> sounds = new HashSet<>();
        int count = 0;
        while (m.find()) {
            String example = m.group(1);
            String sound = m.group(2);
            assertTrue(!sound.isBlank() && sound.length() <= 255, "Son invalide : " + sound);
            assertTrue(!example.isBlank() && example.length() <= 255, "Exemple invalide : " + sound);
            assertTrue(sounds.add(sound), "Son en double : " + sound);
            count++;
        }
        assertTrue(count >= 19, "Cartes trouvées : " + count);
        assertEquals(count, sql.split("WHERE NOT EXISTS", -1).length - 1, "Chaque carte doit être protégée contre les doublons");
    }
}
