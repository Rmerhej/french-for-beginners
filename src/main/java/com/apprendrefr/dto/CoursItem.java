package com.apprendrefr.dto;

/**
 * Utilisé pour la page "Supports de cours" (liste avec lien cours + lien quiz).
 */
public record CoursItem(
        String label,           // Ex: "La phrase simple"
        String urlCours,        // Ex: "/phrase"
        String searchQuiz,      // Ex: "La phrase simple"
        String quizColorClass   // Ex: "text-primary" ou "text-danger"
) {
    // Constructeur pratique avec "text-primary" par défaut
    public CoursItem(String label, String urlCours, String searchQuiz) {
        this(label, urlCours, searchQuiz, "text-primary");
    }
}