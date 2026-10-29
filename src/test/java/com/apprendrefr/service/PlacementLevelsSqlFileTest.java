package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** Niveaux des 60 questions du test de positionnement : 15 questions par niveau, dans l'ordre des numéros. */
class PlacementLevelsSqlFileTest {

    private static final Pattern UPDATE = Pattern.compile(
            "UPDATE `exercises` SET `lesson_level` = '([AB][12])' WHERE `id` BETWEEN (\\d+) AND (\\d+) AND `lesson_title` LIKE 'Test%';");

    @Test
    void fourBlocksOfFifteenQuestionsCoverTheWholeTest() throws IOException {
        String sql = Files.readString(Path.of("init-db", "frenchdb_9_test_positionnement_niveaux.sql"));
        Matcher m = UPDATE.matcher(sql);
        List<String> levels = new ArrayList<>();
        int expectedStart = 424;
        while (m.find()) {
            levels.add(m.group(1));
            assertEquals(expectedStart, Integer.parseInt(m.group(2)), "Les blocs doivent se suivre sans trou");
            assertEquals(expectedStart + 14, Integer.parseInt(m.group(3)), "Chaque bloc compte 15 questions");
            expectedStart += 15;
        }
        assertEquals(List.of("A1", "A2", "B1", "B2"), levels);
        assertEquals(484, expectedStart, "Les questions vont de 424 à 483");
    }
}
