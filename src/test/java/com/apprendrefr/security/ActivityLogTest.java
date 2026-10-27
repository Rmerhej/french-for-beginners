package com.apprendrefr.security;

import com.apprendrefr.security.ActivityLog.Entry;
import com.apprendrefr.security.ActivityLog.Type;
import org.junit.jupiter.api.Test;

import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.time.ZoneId;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class ActivityLogTest {

    private static final class MutableClock extends Clock {
        private Instant now = Instant.parse("2026-10-27T15:01:02Z");

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
    void newestEntryComesFirst_andTimeIsInParisTime() {
        MutableClock clock = new MutableClock();
        ActivityLog log = new ActivityLog(clock);

        log.record("alice", Type.LOGIN);
        clock.advance(Duration.ofMinutes(10));
        log.record("bob", Type.LOGIN);

        List<Entry> entries = log.recent();
        assertEquals(2, entries.size());
        assertEquals("bob", entries.get(0).getUsername());
        assertEquals("alice", entries.get(1).getUsername());
        assertEquals("27/10 16:01:02", entries.get(1).getTime(), "15h01 UTC = 16h01 à Paris (heure d'hiver)");
        assertEquals("Connexion", entries.get(1).getLabel());
    }

    @Test
    void keepsOnlyTheLast50() {
        ActivityLog log = new ActivityLog(new MutableClock());
        for (int i = 0; i < 70; i++) {
            log.record("user" + i, Type.LOGIN);
        }
        List<Entry> entries = log.recent();
        assertEquals(ActivityLog.MAX_ENTRIES, entries.size());
        assertEquals("user69", entries.get(0).getUsername());
        assertEquals("user20", entries.get(49).getUsername());
    }

    @Test
    void sessionClosingRightAfterLogoutIsNotListedTwice() {
        ActivityLog log = new ActivityLog(new MutableClock());
        log.record("alice", Type.LOGOUT);
        log.record("alice", Type.EXPIRED);

        assertEquals(1, log.recent().size());
        assertEquals(Type.LOGOUT, log.recent().get(0).getType());
    }

    @Test
    void logoutArrivingAfterSessionEndReplacesIt() {
        ActivityLog log = new ActivityLog(new MutableClock());
        log.record("alice", Type.EXPIRED);
        log.record("alice", Type.LOGOUT);

        assertEquals(1, log.recent().size());
        assertEquals(Type.LOGOUT, log.recent().get(0).getType());
    }

    @Test
    void laterExpiryIsListedSeparately() {
        MutableClock clock = new MutableClock();
        ActivityLog log = new ActivityLog(clock);
        log.record("alice", Type.LOGOUT);
        clock.advance(Duration.ofMinutes(40));
        log.record("alice", Type.EXPIRED);

        assertEquals(2, log.recent().size());
    }

    @Test
    void otherUsersAreNotMerged() {
        ActivityLog log = new ActivityLog(new MutableClock());
        log.record("alice", Type.LOGOUT);
        log.record("bob", Type.EXPIRED);

        assertEquals(2, log.recent().size());
    }

    @Test
    void blankNamesAreIgnored() {
        ActivityLog log = new ActivityLog(new MutableClock());
        log.record(null, Type.LOGIN);
        log.record("  ", Type.LOGIN);
        assertTrue(log.recent().isEmpty());
    }
}
