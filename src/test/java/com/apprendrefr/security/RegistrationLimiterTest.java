package com.apprendrefr.security;

import org.junit.jupiter.api.Test;

import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.time.ZoneId;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class RegistrationLimiterTest {

    /** Horloge réglable pour simuler le passage du temps. */
    private static final class MutableClock extends Clock {
        private Instant now = Instant.parse("2026-01-01T10:00:00Z");

        void advance(Duration d) {
            now = now.plus(d);
        }

        @Override
        public ZoneId getZone() {
            return ZoneId.of("UTC");
        }

        @Override
        public Clock withZone(ZoneId zone) {
            return this;
        }

        @Override
        public Instant instant() {
            return now;
        }
    }

    @Test
    void allowsUpToTheLimitThenBlocks() {
        RegistrationLimiter limiter = new RegistrationLimiter(3, Duration.ofHours(1), new MutableClock());

        assertTrue(limiter.tryAcquire("1.2.3.4"));
        assertTrue(limiter.tryAcquire("1.2.3.4"));
        assertTrue(limiter.tryAcquire("1.2.3.4"));
        assertFalse(limiter.tryAcquire("1.2.3.4"));
        assertFalse(limiter.tryAcquire("1.2.3.4"));
    }

    @Test
    void eachAddressHasItsOwnCounter() {
        RegistrationLimiter limiter = new RegistrationLimiter(1, Duration.ofHours(1), new MutableClock());

        assertTrue(limiter.tryAcquire("1.1.1.1"));
        assertFalse(limiter.tryAcquire("1.1.1.1"));
        assertTrue(limiter.tryAcquire("2.2.2.2"));
    }

    @Test
    void countersStartAgainAfterTheWindow() {
        MutableClock clock = new MutableClock();
        RegistrationLimiter limiter = new RegistrationLimiter(1, Duration.ofHours(1), clock);

        assertTrue(limiter.tryAcquire("1.1.1.1"));
        assertFalse(limiter.tryAcquire("1.1.1.1"));
        clock.advance(Duration.ofMinutes(59));
        assertFalse(limiter.tryAcquire("1.1.1.1"));
        clock.advance(Duration.ofMinutes(2));
        assertTrue(limiter.tryAcquire("1.1.1.1"));
    }

    @Test
    void missingAddressIsTreatedAsOneUnknownClient() {
        RegistrationLimiter limiter = new RegistrationLimiter(1, Duration.ofHours(1), new MutableClock());

        assertTrue(limiter.tryAcquire(null));
        assertFalse(limiter.tryAcquire(" "));
    }
}
