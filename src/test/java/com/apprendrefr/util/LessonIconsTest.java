package com.apprendrefr.util;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.assertEquals;

class LessonIconsTest {

    @ParameterizedTest
    @CsvSource(delimiter = '|', value = {
            "LES FRUITS |🍎",
            "LES LÉGUMES|🥕",
            "LES VÊTEMENTS|👕",
            "LES COULEURS|🎨",
            "FORMULES DE POLITESSE|🤝",
            "LES PROFESSIONS|👷",
            "LA FAMILLE|👨‍👩‍👧",
            "LES JOURS,MOIS ET DATES|📅",
            "LES ÉMOTIONS|😊",
            "LE TEMPS ET L'HEURE|⏰",
            "LA MAISON|🏠",
            "LES OBJETS|🎒",
            "LES PARTIES DU CORPS|🧍",
            "LES ANIMAUX|🐾",
            "LES ALIMENTS DE BASE|🍞",
            "LES BOISSONS|🥤",
            "À LA MAIRIE ET À LA PRÉFECTURE|🏛️",
            "LE LOGEMENT ET LA LOCATION|🏠"
    })
    void eachVocabularyLessonGetsItsOwnIcon(String title, String icon) {
        assertEquals(icon, LessonIcons.forTitle(title));
    }

    @Test
    void unknownOrMissingTitleGetsTheDefaultIcon() {
        assertEquals(LessonIcons.DEFAULT_ICON, LessonIcons.forTitle("Une leçon inconnue"));
        assertEquals(LessonIcons.DEFAULT_ICON, LessonIcons.forTitle(null));
    }
}
