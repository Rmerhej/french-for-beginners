package com.apprendrefr.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

/** Repère les comptes administrateur, qu'on ne compte pas parmi les « connexions » des apprenants. */
public final class AdminAccounts {

    private static final String ROLE_ADMIN = "ROLE_ADMIN";

    private AdminAccounts() {
    }

    public static boolean isAdmin(Collection<? extends GrantedAuthority> authorities) {
        return authorities != null
                && authorities.stream().anyMatch(a -> ROLE_ADMIN.equals(a.getAuthority()));
    }

    public static boolean isAdmin(Authentication auth) {
        return auth != null && isAdmin(auth.getAuthorities());
    }

    /** Vrai si l'objet « principal » de la session est un administrateur. */
    public static boolean isAdminPrincipal(Object principal) {
        return principal instanceof org.springframework.security.core.userdetails.UserDetails user
                && isAdmin(user.getAuthorities());
    }
}
