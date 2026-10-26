package com.apprendrefr.util;

import com.apprendrefr.service.ConjugationService;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class ConjugationLevelsTest {

    private final ConjugationService conjugator = new ConjugationService();

    /** Un verbe inconnu du conjugueur donnerait un lien « verbe introuvable » sur la page. */
    @Test
    void everySuggestedVerbIsKnownByTheConjugator() {
        for (String level : List.of("A1", "A2", "B1", "B2")) {
            ConjugationLevels.Info info = ConjugationLevels.of(level);
            assertFalse(info.temps().isBlank(), level);
            assertFalse(info.verbes().isEmpty(), level);
            for (String verb : info.verbes()) {
                assertTrue(conjugator.conjugate(verb).isPresent(), level + " : verbe inconnu du conjugueur : " + verb);
            }
        }
    }
}
