package com.apprendrefr.security;

import java.util.Locale;
import java.util.Set;

/**
 * Point unique de normalisation des rôles.
 * <p>
 * La base contient historiquement "USER", "ROLE_USER", "ADMIN" et
 * "ROLE_ADMIN".
 * Toutes ces valeurs sont ramenées à la forme préfixée attendue par Spring
 * Security.
 */
public final class Roles {
    public static final String USER = "ROLE_USER";
    public static final String ADMIN = "ROLE_ADMIN";
    private static final Set<String> ALLOWED = Set.of(USER, ADMIN);

    private Roles() {
    }

    /**
     * "admin", "ADMIN" et "ROLE_ADMIN" donnent tous "ROLE_ADMIN" ; une
     * valeur vide donne le rôle le moins privilégié.
     */
    public static String normalize(String role) {
        if (role == null || role.isBlank()) {
            return USER;
        }
        String value = role.trim().toUpperCase(Locale.ROOT);
        return value.startsWith("ROLE_") ? value : "ROLE_" + value;
    }

    /**
     * Vrai si la valeur désigne l'un des rôles connus de l'application.
     */
    public static boolean isAllowed(String role) {
        return role != null && !role.isBlank() &&

                ALLOWED.contains(normalize(role));
    }
}
