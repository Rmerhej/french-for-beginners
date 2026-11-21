package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Traductions en anglais (en) et en arabe (ar) : la migration V8 couvre exactement les textes déjà traduits
 * (V3 à V7), et les scripts des lots 5 et 6 et des thèmes de cuisine couvrent les nouveaux textes.
 */
class EnglishArabicTranslationFilesTest {

    private static final Pattern ARABIC = Pattern.compile("[\\u0600-\\u06FF]");
    private static final Pattern ROW = Pattern.compile("\\('(VOCAB_WORD|VOCAB_SENTENCE|THEME_DIALOGUE)', (\\d+), '([a-z]{2})', '");

    private static String readInitDb(String name) throws IOException {
        return Files.readString(Path.of("init-db", name));
    }

    private static String readMigration(String name) throws IOException {
        return Files.readString(Path.of("src/main/resources/db/migration", name));
    }

    private static int count(String text, String needle) {
        int n = 0;
        for (int i = text.indexOf(needle); i >= 0; i = text.indexOf(needle, i + needle.length())) {
            n++;
        }
        return n;
    }

    private static Set<String> keys(String sql, String lang) {
        Set<String> keys = new HashSet<>();
        Matcher m = ROW.matcher(sql);
        while (m.find()) {
            if (m.group(3).equals(lang)) {
                keys.add(m.group(1) + ":" + m.group(2));
            }
        }
        return keys;
    }

    @Test
    void migrationCoversEveryTextAlreadyTranslatedInSpanish() throws IOException {
        Set<String> spanish = new HashSet<>();
        for (String file : new String[] {"V3__traductions_essai_cafe_fruits.sql", "V4__traductions_lot1_vocabulaire.sql",
                "V5__traductions_lot2_vocabulaire.sql", "V6__traductions_lot3_vocabulaire.sql", "V7__traductions_dialogues.sql"}) {
            spanish.addAll(keys(readMigration(file), "es"));
        }
        String v8 = readMigration("V8__traductions_anglais_arabe.sql");
        assertTrue(spanish.size() > 1000, "Les traductions espagnoles n'ont pas été trouvées");
        assertEquals(spanish, keys(v8, "en"), "Textes manquants ou en trop en anglais");
        assertEquals(spanish, keys(v8, "ar"), "Textes manquants ou en trop en arabe");
        assertTrue(v8.contains("ON DUPLICATE KEY UPDATE"), "La migration doit pouvoir être rejouée sans erreur");
        assertFalse(v8.contains("reviewed = 1"), "Traductions automatiques : jamais marquées comme relues");
    }

    @Test
    void arabicRowsAreArabicAndEnglishRowsAreNot() throws IOException {
        String v8 = readMigration("V8__traductions_anglais_arabe.sql");
        Matcher m = Pattern.compile("\\('[A-Z_]+', \\d+, '(en|ar)', '((?:[^']|'')*)', 0\\)").matcher(v8);
        int rows = 0;
        while (m.find()) {
            rows++;
            boolean arabic = ARABIC.matcher(m.group(2)).find();
            if (m.group(1).equals("ar")) {
                assertTrue(arabic, "Texte arabe sans lettre arabe : " + m.group(2));
            } else {
                assertFalse(arabic, "Texte anglais contenant de l'arabe : " + m.group(2));
            }
        }
        assertEquals(2128, rows, "Nombre de traductions de la migration");
    }

    @Test
    void lots5And6AreTranslatedInEnglishAndArabic() throws IOException {
        String[][] lots = {{"frenchdb_9_vocab_lot5.sql", "frenchdb_9_traductions_en_ar_lot5.sql"},
                {"frenchdb_9_vocab_lot6.sql", "frenchdb_9_traductions_en_ar_lot6.sql"}};
        for (String[] lot : lots) {
            int words = count(readInitDb(lot[0]), "AND NOT EXISTS (SELECT 1 FROM `vocabularies` x");
            String translations = readInitDb(lot[1]);
            assertTrue(words >= 30, "Mots du lot introuvables : " + lot[0]);
            for (String lang : new String[] {"en", "ar"}) {
                assertEquals(words, count(translations, "SELECT 'VOCAB_WORD', v.`id`, '" + lang + "', '"), lot[1] + " : mots en " + lang);
                assertEquals(words, count(translations, "SELECT 'VOCAB_SENTENCE', v.`id`, '" + lang + "', '"), lot[1] + " : phrases en " + lang);
            }
            assertTrue(translations.contains("INSERT IGNORE"), "Le script doit pouvoir être relancé");
        }
    }

    @Test
    void cuisineThemesAreTranslatedInEnglishAndArabic() throws IOException {
        String sql = readInitDb("frenchdb_9_traductions_en_ar_themes_cuisine.sql");
        for (String lang : new String[] {"en", "ar"}) {
            assertEquals(2, count(sql, "SELECT 'THEME_DIALOGUE', t.`id`, '" + lang + "', "), "Deux dialogues en " + lang);
        }
        for (String nom : new String[] {"Dans la cuisine", "Cuisiner"}) {
            assertEquals(2, count(sql, "WHERE t.`nom` = '" + nom + "';"), "Thème " + nom + " : anglais et arabe");
        }
        assertEquals(4, count(sql, "SELECT 'THEME_DIALOGUE'"));
    }
}
