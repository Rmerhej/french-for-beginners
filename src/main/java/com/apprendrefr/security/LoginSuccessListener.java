package com.apprendrefr.security;

import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.stereotype.Component;

/** Remet à zéro le compteur d'échecs d'un utilisateur après une connexion réussie. */
@Component
public class LoginSuccessListener {

    private final LoginAttemptService attempts;

    public LoginSuccessListener(LoginAttemptService attempts) {
        this.attempts = attempts;
    }

    @EventListener
    public void onSuccess(AuthenticationSuccessEvent event) {
        attempts.recordSuccess(event.getAuthentication().getName());
    }
}
