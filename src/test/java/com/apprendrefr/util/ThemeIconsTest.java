package com.apprendrefr.util;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ThemeIconsTest {

    @ParameterizedTest
    @CsvSource(delimiter = '|', value = {
            "Au restaurant|🍽️",
            "Chez le médecin|🩺",
            "À la pharmacie|💊",
            "Au Bureau|💼",
            "Au café|☕",
            "Faire du shopping|🛍️",
            "Au supermarché|🛒",
            "En voyage|✈️",
            "À la banque|🏦",
            "À la poste|✉️",
            "À la gare|🚉",
            "Dans le bus|🚌",
            "Chez le coiffeur|💇",
            "À la station-service|⛽",
            "Au musée|🏛️",
            "À la préfecture|📋",
            "À l'hôtel|🏨"
    })
    void eachLessonTitleGetsItsOwnIcon(String title, String icon) {
        assertEquals(icon, ThemeIcons.forTitle(title));
    }

    @Test
    void unknownOrMissingTitleGetsTheDefaultIcon() {
        assertEquals(ThemeIcons.DEFAULT_ICON, ThemeIcons.forTitle("Une leçon inconnue"));
        assertEquals(ThemeIcons.DEFAULT_ICON, ThemeIcons.forTitle(null));
    }

    @Test
    void wordMatchingDoesNotConfuseSimilarWords() {
        // « bus » ne doit pas être trouvé dans « abus »
        assertEquals(ThemeIcons.DEFAULT_ICON, ThemeIcons.forTitle("Les abus"));
    }
}
