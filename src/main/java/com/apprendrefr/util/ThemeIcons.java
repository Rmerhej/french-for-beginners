package com.apprendrefr.util;

import java.text.Normalizer;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Choisit l'icône (emoji) d'une carte de la page /themes d'après le titre de la leçon.
 * Pour une nouvelle icône : ajouter une ligne "mot du titre" -> emoji (mots en minuscules, sans accent).
 * Un titre inconnu reçoit l'ampoule par défaut.
 */
public final class ThemeIcons {

    public static final String DEFAULT_ICON = "💡";

    private static final Map<Pattern, String> ICONS = new LinkedHashMap<>();

    static {
        add("restaurant", "🍽️");
        add("medecin|docteur|hopital", "🩺");
        add("pharmacie", "💊");
        add("bureau|travail", "💼");
        add("cafe", "☕");
        add("boulangerie", "🥖");
        add("shopping|magasin", "🛍️");
        add("supermarche", "🛒");
        add("voyage", "✈️");
        add("aeroport", "🛫");
        add("hotel", "🏨");
        add("banque", "🏦");
        add("poste", "✉️");
        add("gare|train", "🚉");
        add("bus", "🚌");
        add("metro", "🚇");
        add("taxi", "🚕");
        add("coiffeur", "💇");
        add("station-service|essence", "⛽");
        add("musee", "🏛️");
        add("prefecture|mairie", "📋");
        add("ecole|universite", "🎓");
        add("cinema", "🎬");
        add("police", "👮");
    }

    private ThemeIcons() {
    }

    private static void add(String words, String icon) {
        ICONS.put(Pattern.compile("\\b(" + words + ")\\b"), icon);
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
