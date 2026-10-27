package com.apprendrefr.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.authentication.event.LogoutSuccessEvent;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/** Note dans les journaux et sur le tableau de bord qui se connecte et qui se déconnecte. */
@Component
public class SessionActivityListener {

    private static final Logger log = LoggerFactory.getLogger(SessionActivityListener.class);

    private final ActivityLog activity;

    public SessionActivityListener(ActivityLog activity) {
        this.activity = activity;
    }

    @EventListener
    public void onLogin(AuthenticationSuccessEvent event) {
        Authentication auth = event.getAuthentication();
        if (auth == null || auth instanceof AnonymousAuthenticationToken) {
            return;
        }
        boolean automatic = auth instanceof RememberMeAuthenticationToken;
        log.info("Utilisateur connecté : {}{}", auth.getName(), automatic ? " (reconnexion automatique)" : "");
        activity.record(auth.getName(), automatic ? ActivityLog.Type.AUTO_LOGIN : ActivityLog.Type.LOGIN);
    }

    @EventListener
    public void onLogout(LogoutSuccessEvent event) {
        Authentication auth = event.getAuthentication();
        if (auth == null || auth instanceof AnonymousAuthenticationToken) {
            return;
        }
        log.info("Utilisateur déconnecté : {} (déconnexion volontaire)", auth.getName());
        activity.record(auth.getName(), ActivityLog.Type.LOGOUT);
    }

    /** Fin d'une session : par inactivité (30 minutes) ou après un clic sur « Déconnexion ». */
    @EventListener
    public void onSessionDestroyed(SessionDestroyedEvent event) {
        if (isLogoutRequest()) {
            return; // déjà noté par onLogout
        }
        for (SecurityContext context : event.getSecurityContexts()) {
            Authentication auth = context.getAuthentication();
            if (auth == null || auth instanceof AnonymousAuthenticationToken || !auth.isAuthenticated()) {
                continue;
            }
            log.info("Utilisateur déconnecté : {} (session expirée)", auth.getName());
            activity.record(auth.getName(), ActivityLog.Type.EXPIRED);
        }
    }

    private static boolean isLogoutRequest() {
        if (RequestContextHolder.getRequestAttributes() instanceof ServletRequestAttributes attrs) {
            return "/logout".equals(attrs.getRequest().getServletPath());
        }
        return false;
    }
}
