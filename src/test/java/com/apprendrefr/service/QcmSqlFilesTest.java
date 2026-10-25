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
        String sql = Files.readString(Path.of("init-db/frenchdb_9_qcm_vocabulaire.sql"));
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
        assertEquals(66, checked);
        assertEquals(checked, sql.split("NOT EXISTS", -1).length - 1, "Chaque QCM doit être protégé contre les doublons");
        Set<String> titles = new HashSet<>();
        Matcher t = Pattern.compile("WHERE `lesson_title` = " + Q).matcher(sql);
        while (t.find()) titles.add(t.group(1));
        assertEquals(11, titles.size());
    }
}
