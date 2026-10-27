package com.apprendrefr.security;

import org.junit.jupiter.api.Test;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.authentication.event.LogoutSuccessEvent;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.session.SessionDestroyedEvent;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class SessionActivityListenerTest {

    private final ActivityLog activity = new ActivityLog();
    private final SessionActivityListener listener = new SessionActivityListener(activity);

    private static UsernamePasswordAuthenticationToken user(String name) {
        return new UsernamePasswordAuthenticationToken(name, "x", List.of(new SimpleGrantedAuthority("ROLE_USER")));
    }

    private static SessionDestroyedEvent destroyed(SecurityContext... contexts) {
        return new SessionDestroyedEvent("source") {
            @Override
            public List<SecurityContext> getSecurityContexts() {
                return List.of(contexts);
            }

            @Override
            public String getId() {
                return "session-1";
            }
        };
    }

    @Test
    void formLoginIsRecorded() {
        listener.onLogin(new AuthenticationSuccessEvent(user("alice")));

        assertEquals(ActivityLog.Type.LOGIN, activity.recent().get(0).getType());
        assertEquals("alice", activity.recent().get(0).getUsername());
    }

    @Test
    void rememberMeLoginIsShownAsAutomaticReconnection() {
        listener.onLogin(new AuthenticationSuccessEvent(
                new RememberMeAuthenticationToken("key", "alice", List.of(new SimpleGrantedAuthority("ROLE_USER")))));

        assertEquals(ActivityLog.Type.AUTO_LOGIN, activity.recent().get(0).getType());
    }

    @Test
    void anonymousIsNeverRecorded() {
        AnonymousAuthenticationToken anonymous = new AnonymousAuthenticationToken(
                "key", "anonymousUser", List.of(new SimpleGrantedAuthority("ROLE_ANONYMOUS")));
        listener.onLogin(new AuthenticationSuccessEvent(anonymous));
        listener.onLogout(new LogoutSuccessEvent(anonymous));

        assertTrue(activity.recent().isEmpty());
    }

    @Test
    void logoutIsRecorded() {
        listener.onLogout(new LogoutSuccessEvent(user("alice")));

        assertEquals(ActivityLog.Type.LOGOUT, activity.recent().get(0).getType());
    }

    @Test
    void sessionEndIsRecordedAsExpiredForEachLoggedInUser() {
        listener.onSessionDestroyed(destroyed(
                new SecurityContextImpl(user("alice")),
                new SecurityContextImpl(user("bob"))));

        assertEquals(2, activity.recent().size());
        assertEquals(ActivityLog.Type.EXPIRED, activity.recent().get(0).getType());
    }

    @Test
    void sessionWithoutLoginIsIgnored() {
        listener.onSessionDestroyed(destroyed(new SecurityContextImpl()));

        assertTrue(activity.recent().isEmpty());
    }
}
