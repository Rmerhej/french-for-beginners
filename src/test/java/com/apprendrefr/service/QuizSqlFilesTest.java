package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** Contrôle des scripts SQL de quiz (init-db/frenchdb_9_quiz_*.sql) : une erreur de saisie se verrait en classe. */
class QuizSqlFilesTest {

    private static final String Q = "'((?:[^']|'')*)'";
    private static final Pattern ROW = Pattern.compile(
            "SELECT " + Q + ", '', " + Q + ", " + Q + ", " + Q + ", NULL FROM DUAL");

    private static String unescape(String sql) {
        return sql.replace("''", "'");
    }

    @Test
    void everyQuizHasAsManyAnswersAsBlanks_andAnswersAreInTheWordList() throws IOException {
        List<Path> files;
        try (Stream<Path> stream = Files.list(Path.of("init-db"))) {
            files = stream.filter(p -> p.getFileName().toString().startsWith("frenchdb_9_quiz_"))
                    .filter(p -> p.toString().endsWith(".sql")).sorted().toList();
        }
        assertFalse(files.isEmpty());

        int checked = 0;
        for (Path file : files) {
            Matcher m = ROW.matcher(Files.readString(file));
            while (m.find()) {
                String answers = unescape(m.group(1));
                String sentence = unescape(m.group(2));
                String title = unescape(m.group(3));
                Set<String> words = new HashSet<>(Arrays.asList(unescape(m.group(4)).split(",")));
                String where = file.getFileName() + " : " + sentence;

                String[] expected = answers.split(",");
                int blanks = sentence.split("____", -1).length - 1;
                assertEquals(blanks, expected.length, "Nombre de cases et de réponses différent : " + where);
                for (String answer : expected) {
                    assertTrue(words.contains(answer), "Réponse absente des mots proposés (" + answer + ") : " + where);
                }
                assertTrue(title.contains(" - "), "Titre inattendu : " + where);
                checked++;
            }
        }
        assertTrue(checked >= 60, "Trop peu de quiz trouvés : " + checked);
    }
}
