package com.apprendrefr.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "themes")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Theme {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String nom;        // restaurant, medecin, etc.

    @Column(nullable = false)
    private String title;      // "Au restaurant"

    @Column(columnDefinition = "TEXT")   // Pour du contenu plus long
    private String dialogueContent;   // ← Nouveau champ
    @Column
    private String audio;
}