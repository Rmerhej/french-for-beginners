package com.apprendrefr.service;

import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Service;

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
}