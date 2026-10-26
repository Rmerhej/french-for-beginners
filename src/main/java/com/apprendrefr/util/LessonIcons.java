package com.apprendrefr.util;

import java.text.Normalizer;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Choisit l'icône (emoji) d'une carte d'une leçon de vocabulaire d'après son titre.
 * Pour une nouvelle icône : ajouter une ligne "mot du titre" -> emoji (mots en minuscules, sans accent).
 * Un titre inconnu reçoit l'ampoule par défaut.
 */
public final class LessonIcons {

    public static final String DEFAULT_ICON = "💡";

    private static final Map<Pattern, String> ICONS = new LinkedHashMap<>();

    static {
        add("fruit", "🍎");
        add("legume", "🥕");
        add("vetement", "👕");
        add("couleur", "🎨");
        add("politesse", "🤝");
        add("profession|metier", "👷");
        add("famille", "👨‍👩‍👧");
        add("jours|mois|dates|calendrier", "📅");
        add("emotion|sentiment", "😊");
        add("temps|heure", "⏰");
        add("maison|logement", "🏠");
        add("objet", "🎒");
        add("corps", "🧍");
        add("animaux|animal", "🐾");
        add("chiffre|nombre", "🔢");
        add("alphabet|lettre", "🔤");
        add("nourriture|repas|aliment", "🍞");
        add("transport", "🚗");
        add("meteo|saison", "☀️");
        add("sport", "⚽");
        add("ville|quartier", "🏙️");
        add("nature", "🌳");
        add("ecole|etude", "🎓");
        add("musique", "🎵");
    }

    private LessonIcons() {
    }

    private static void add(String words, String icon) {
        ICONS.put(Pattern.compile("\\b(" + words + ")s?\\b"), icon);
    }

    /** Renvoie l'icône qui correspond au titre (sans accent ni majuscule), ou l'ampoule par défaut. */
    public static String forTitle(String title) {
        if (title == null) {
            return DEFAULT_ICON;
        }
        String normalized = Normalizer.normalize(title, Normalizer.Form.NFD)
                .replaceAll("\\p{M}", "")
                .toLowerCase(Locale.ROOT);
        for (Map.Entry<Pattern, String> entry : ICONS.entrySet()) {
            if (entry.getKey().matcher(normalized).find()) {
                return entry.getValue();
            }
        }
        return DEFAULT_ICON;
    }
}
