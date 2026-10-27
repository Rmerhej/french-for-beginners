package com.apprendrefr.service;

import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OnlineUserService {

    private final SessionRegistry sessionRegistry;

    public OnlineUserService(SessionRegistry sessionRegistry) {
        this.sessionRegistry = sessionRegistry;
    }
    /* compte les connexions( ex: Chrome + Firefox = 2) */
    public int getActiveSessionsCount() {

        return sessionRegistry.getAllPrincipals()
                .stream()
                .mapToInt(principal ->
                        sessionRegistry.getAllSessions(principal, false).size()
                )
                .sum();
    }


    /*
     compte les utilisateurs uniques (Chrome + Firefox =1)
     */
    public int getOnlineUsersCount() {

        return sessionRegistry.getAllPrincipals()
                .size();
    }

    /** Pseudos des personnes qui ont au moins une session ouverte, par ordre alphabétique. */
    public List<String> getOnlineUsernames() {
        return sessionRegistry.getAllPrincipals().stream()
                .filter(principal -> !sessionRegistry.getAllSessions(principal, false).isEmpty())
                .map(principal -> principal instanceof UserDetails user ? user.getUsername() : "inconnu")
                .sorted(String.CASE_INSENSITIVE_ORDER)
                .toList();
    }
}
