package com.apprendrefr.security;

import org.junit.jupiter.api.Test;

import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.time.ZoneOffset;

import static org.junit.jupiter.api.Assertions.*;

class LoginAttemptServiceTest {

    /** Horloge réglable pour simuler le temps qui passe. */
    private static final class MutableClock extends Clock {
        private Instant now = Instant.parse("2026-01-01T10:00:00Z");

        void advance(Duration d) { now = now.plus(d); }

        @Override public java.time.ZoneId getZone() { return ZoneOffset.UTC; }
        @Override public Clock withZone(java.time.ZoneId zone) { return this; }
        @Override public Instant instant() { return now; }
    }

    private final MutableClock clock = new MutableClock();
    private final LoginAttemptService service =
            new LoginAttemptService(3, 5, Duration.ofMinutes(15), clock);

    @Test
    void notBlockedBeforeLimit() {
        service.recordFailure("marie", "1.1.1.1");
        service.recordFailure("marie", "1.1.1.1");
        assertFalse(service.isBlocked("marie", "1.1.1.1"));
    }

    @Test
    void blockedAfterTooManyFailuresForUser() {
        for (int i = 0; i < 3; i++) service.recordFailure("Marie", "1.1.1." + i);
        assertTrue(service.isBlocked("marie", "9.9.9.9"));   // casse ignorée, autre IP
        assertFalse(service.isBlocked("paul", "9.9.9.9"));   // autre utilisateur non touché
    }

    @Test
    void unblockedAfterLockDuration() {
        for (int i = 0; i < 3; i++) service.recordFailure("marie", "1.1.1.1");
        assertTrue(service.isBlocked("marie", "9.9.9.9"));
        clock.advance(Duration.ofMinutes(16));
        assertFalse(service.isBlocked("marie", "9.9.9.9"));
    }

    @Test
    void successResetsUserCounter() {
        service.recordFailure("marie", "1.1.1.1");
        service.recordFailure("marie", "1.1.1.1");
        service.recordSuccess("marie");
        service.recordFailure("marie", "1.1.1.1");
        assertFalse(service.isBlocked("marie", "9.9.9.9"));
    }

    @Test
    void ipBlockedAfterTooManyFailuresOnDifferentUsers() {
        for (int i = 0; i < 5; i++) service.recordFailure("user" + i, "2.2.2.2");
        assertTrue(service.isBlocked("nouveau", "2.2.2.2"));
        assertFalse(service.isBlocked("nouveau", "3.3.3.3"));
    }
}