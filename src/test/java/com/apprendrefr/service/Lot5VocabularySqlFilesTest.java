package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Lot 5 : « Les jours de la semaine », « Les mois de l'année », « Les directions et la position ».
 * Vérifie que chaque leçon a ses mots, ses QCM et ses traductions (zh, ko, pt, es).
 */
class Lot5VocabularySqlFilesTest {

    private static final String[] TITLES = {
            "LES JOURS DE LA SEMAINE", "LES MOIS DE L''ANNÉE", "LES DIRECTIONS ET LA POSITION"};

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
    void everyLessonHasWordsAndQcm() throws IOException {
        String vocab = read("frenchdb_9_vocab_lot5.sql");
        String qcm = read("frenchdb_9_qcm_vocabulaire_7.sql");
        for (String title : TITLES) {
            assertEquals(1, count(vocab, "'A1', '" + title + "' FROM DUAL"), "Leçon manquante : " + title);
            assertTrue(count(vocab, "SELECT MIN(`id`) FROM `lessons` WHERE `title` = '" + title + "') AND NOT EXISTS") >= 15,
                    "Trop peu de mots : " + title);
            assertTrue(count(qcm, "WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = '" + title + "'") >= 10,
                    "Trop peu de QCM : " + title);
        }
    }

    @Test
    void everyWordHasAWordAndASentenceTranslationInFourLanguages() throws IOException {
        String vocab = read("frenchdb_9_vocab_lot5.sql");
        String translations = read("frenchdb_9_traductions_lot5.sql");
        int words = count(vocab, "AND NOT EXISTS (SELECT 1 FROM `vocabularies` x");
        assertEquals(words * 4, count(translations, "SELECT 'VOCAB_WORD'"));
        assertEquals(words * 4, count(translations, "SELECT 'VOCAB_SENTENCE'"));
        for (String lang : new String[] {"zh", "ko", "pt", "es"}) {
            Matcher m = Pattern.compile("SELECT 'VOCAB_WORD', v\\.`id`, '" + lang + "', '").matcher(translations);
            int n = 0;
            while (m.find()) {
                n++;
            }
            assertEquals(words, n, "Traductions de mots en " + lang);
        }
        assertTrue(translations.contains("INSERT IGNORE"), "Le script doit pouvoir être relancé");
    }
}
