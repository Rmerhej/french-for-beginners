package com.apprendrefr.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "exercises")
@Data
public class Exercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String lessonTitle;

    @Column(columnDefinition = "TEXT")
    private String question;           // Pour QCM

    // === Type QCM ===
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private String correctAnswer;

    // === Nouveau Type : Compléter les phrases ===
    private String exerciseType;       // "QCM" ou "MATCHING"

    @Column(columnDefinition = "TEXT")
    private String words;              // ex: "pomme;chat;maison;voiture;livre"

    @Column(columnDefinition = "TEXT")
    private String sentences;          // ex: "Je mange une ___ rouge.;Le ___ dort sur le lit.;..."

    @Column(columnDefinition = "TEXT")
    private String explanation;

    private String lessonLevel;        // Optionnel : A1, A2...
}