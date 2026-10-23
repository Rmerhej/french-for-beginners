package com.apprendrefr.service;

import com.apprendrefr.dto.Conjugation;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

class ConjugationServiceTest {

    private final ConjugationService service = new ConjugationService();

    private String line(String verb, String mood, String tense, int index) {
        Conjugation c = service.conjugate(verb).orElseThrow();
        return c.moods().stream().filter(m -> m.name().equals(mood)).findFirst().orElseThrow()
                .tenses().stream().filter(t -> t.name().equals(tense)).findFirst().orElseThrow()
                .lines().get(index);
    }

    @ParameterizedTest
    @CsvSource(quoteCharacter = '"', value = {
            "manger, Indicatif, Présent, 3, nous mangeons",
            "manger, Indicatif, Imparfait, 0, je mangeais",
            "commencer, Indicatif, Présent, 3, nous commençons",
            "appeler, Indicatif, Futur simple, 0, j'appellerai",
            "acheter, Indicatif, Présent, 0, j'achète",
            "préférer, Indicatif, Présent, 5, ils/elles préfèrent",
            "payer, Indicatif, Présent, 0, je paie",
            "envoyer, Indicatif, Futur simple, 0, j'enverrai",
            "finir, Indicatif, Présent, 3, nous finissons",
            "attendre, Indicatif, Passé composé, 0, j'ai attendu",
            "aller, Indicatif, Présent, 0, je vais",
            "aller, Indicatif, Passé composé, 0, je suis allé(e)",
            "être, Indicatif, Présent, 4, vous êtes",
            "avoir, Subjonctif, Présent, 0, que j'aie",
            "faire, Indicatif, Présent, 4, vous faites",
            "pouvoir, Indicatif, Futur simple, 0, je pourrai",
            "venir, Indicatif, Présent, 5, ils/elles viennent",
            "prendre, Subjonctif, Présent, 2, qu'il/elle/on prenne",
            "recevoir, Indicatif, Présent, 0, je reçois",
            "voir, Indicatif, Futur simple, 0, je verrai",
            "boire, Indicatif, Présent, 5, ils/elles boivent",
            "partir, Indicatif, Passé composé, 4, vous êtes parti(e)(s)",
            "devenir, Indicatif, Futur simple, 0, je deviendrai",
            "nettoyer, Indicatif, Présent, 0, je nettoie"
    })
    void goldForms(String verb, String mood, String tense, int index, String expected) {
        assertEquals(expected, line(verb, mood, tense, index));
    }

    @Test
    void lookupIgnoresAccentsAndCase() {
        assertEquals("préférer", service.conjugate("  PREFERER ").orElseThrow().infinitive());
        assertEquals("être", service.conjugate("etre").orElseThrow().infinitive());
    }

    @Test
    void unknownSafeErVerbGetsWarning() {
        Conjugation c = service.conjugate("zozoter").orElseThrow();
        assertNotNull(c.note());
        assertEquals("je zozote", line("zozoter", "Indicatif", "Présent", 0));
    }

    @Test
    void invalidInputIsRejected() {
        assertTrue(service.conjugate(null).isEmpty());
        assertTrue(service.conjugate("").isEmpty());
        assertTrue(service.conjugate("bonjour").isEmpty());
        assertTrue(service.conjugate("x".repeat(100)).isEmpty());
    }

    @Test
    void everyKnownVerbProducesCompleteTables() {
        for (String verb : service.knownVerbs()) {
            Conjugation c = service.conjugate(verb).orElseThrow();
            c.moods().forEach(m -> m.tenses().forEach(t ->
                    assertTrue(t.lines().stream().noneMatch(l -> l.contains("null")), verb + " " + t.name())));
        }
    }
}
