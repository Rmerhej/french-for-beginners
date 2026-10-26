package com.apprendrefr.util;

import java.util.List;
import java.util.Map;

/**
 * Textes de la page « Conjugaison par niveau » : les temps à connaître et des verbes à s'entraîner
 * à conjuguer pour chaque niveau. Chaque verbe doit être connu du conjugueur (vérifié par un test).
 */
public final class ConjugationLevels {

    public record Info(String temps, List<String> verbes) {
    }

    private static final Map<String, Info> LEVELS = Map.of(
            "A1", new Info("Le présent, le futur proche et l'impératif",
                    List.of("être", "avoir", "parler", "aimer", "habiter", "manger", "aller", "faire")),
            "A2", new Info("Le passé composé, l'imparfait, le futur simple et le conditionnel de politesse",
                    List.of("finir", "choisir", "vendre", "attendre", "prendre", "venir", "pouvoir", "vouloir",
                            "devoir", "savoir", "voir", "dire")),
            "B1", new Info("Le plus-que-parfait, le futur antérieur et le conditionnel passé",
                    List.of("partir", "sortir", "mettre", "lire", "écrire", "connaître", "croire", "vivre")),
            "B2", new Info("Le subjonctif, la concordance des temps, le participe présent et le gérondif",
                    List.of("faire", "pouvoir", "savoir", "aller", "être", "avoir", "recevoir", "suivre")));

    private ConjugationLevels() {
    }

    public static Info of(String code) {
        return LEVELS.getOrDefault(code, new Info("", List.of()));
    }

    public static Map<String, Info> all() {
        return LEVELS;
    }
}
