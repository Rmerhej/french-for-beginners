package com.apprendrefr.dto;

import java.util.List;

/**
 * Parcours d'un niveau (A1, A2, B1, B2) pour la page « Supports de cours ».
 * Un niveau contient des blocs thématiques ; chaque bloc contient des étapes numérotées.
 */
public record ParcoursNiveau(String code, String emoji, String verbe, String titre,
                             String objectif, String couleur, List<Bloc> blocs) {

    public record Bloc(String titre, int debut, List<Etape> etapes) {}

    /** type : "G" = grammaire, "C" = conjugaison */
    public record Etape(String titre, String url, String quiz, String type) {}
}
