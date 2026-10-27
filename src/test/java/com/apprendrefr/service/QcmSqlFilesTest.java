package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** Contrôle du script SQL des QCM de vocabulaire : la bonne réponse doit être l'une des 4 options, et les options doivent être différentes. */
class QcmSqlFilesTest {

    private static final String Q = "'((?:[^']|'')*)'";
    private static final Pattern ROW = Pattern.compile(
            "SELECT " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + ", " + Q + " FROM DUAL");

    private static String unescape(String s) {
        return s.replace("''", "'");
    }

    @Test
    void everyQcmHasItsAnswerAmongFourDistinctOptions() throws IOException {
        // tous les fichiers de QCM de vocabulaire (frenchdb_9_qcm_*.sql)
        StringBuilder all = new StringBuilder();
        try (Stream<Path> stream = Files.list(Path.of("init-db"))) {
            for (Path file : stream.filter(p -> p.getFileName().toString().startsWith("frenchdb_9_qcm_"))
                    .filter(p -> p.toString().endsWith(".sql")).sorted().toList()) {
                all.append(Files.readString(file)).append('\n');
            }
        }
        String sql = all.toString();
        Matcher m = ROW.matcher(sql);
        int checked = 0;
        while (m.find()) {
            String answer = unescape(m.group(1));
            String explanation = unescape(m.group(2));
            String question = unescape(m.group(8));
            List<String> options = List.of(unescape(m.group(4)), unescape(m.group(5)),
                    unescape(m.group(6)), unescape(m.group(7)));

            assertTrue(options.contains(answer), "Réponse absente des options : " + question);
            assertEquals(4, new HashSet<>(options).size(), "Options en double : " + question);
            assertTrue(explanation.length() <= 255, "Explication trop longue : " + question);
            checked++;
        }
        assertTrue(checked >= 187, "Trop peu de QCM trouvés : " + checked);
        assertEquals(checked, sql.split("NOT EXISTS", -1).length - 1, "Chaque QCM doit être protégé contre les doublons");
        Set<String> titles = new HashSet<>();
        Matcher t = Pattern.compile("WHERE `lesson_title` = " + Q).matcher(sql);
        while (t.find()) titles.add(t.group(1));
        assertTrue(titles.size() >= 24, "Trop peu de leçons couvertes : " + titles.size());
    }
}
