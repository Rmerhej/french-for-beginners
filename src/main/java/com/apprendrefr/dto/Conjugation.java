package com.apprendrefr.dto;

import java.util.List;

/**
 * Conjugaison complète d'un verbe, prête à être affichée.
 * Chaque ligne d'un temps est déjà complète (« j'aime », « que tu aimes »…).
 */
public record Conjugation(String infinitive, String group, String auxiliary,
                          String pastParticiple, String presentParticiple,
                          String note, List<Mood> moods) {

    public record Mood(String name, List<Tense> tenses) {
    }

    public record Tense(String name, List<String> lines) {
    }
}
