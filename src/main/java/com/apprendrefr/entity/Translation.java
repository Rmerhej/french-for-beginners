package com.apprendrefr.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/** Traduction d'un texte de leçon dans une langue (voir db/migration/V2__traductions.sql). */
@Entity
@Table(name = "translations")
@Getter @Setter @NoArgsConstructor
public class Translation {

    public static final String THEME_DIALOGUE = "THEME_DIALOGUE";
    public static final String VOCAB_WORD = "VOCAB_WORD";
    public static final String VOCAB_SENTENCE = "VOCAB_SENTENCE";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 30)
    private String kind;

    @Column(name = "entity_id", nullable = false)
    private Long entityId;

    @Column(nullable = false, length = 5)
    private String lang;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String content;

    @Column(nullable = false)
    private boolean reviewed;

    public Translation(String kind, Long entityId, String lang, String content, boolean reviewed) {
        this.kind = kind;
        this.entityId = entityId;
        this.lang = lang;
        this.content = content;
        this.reviewed = reviewed;
    }
}
