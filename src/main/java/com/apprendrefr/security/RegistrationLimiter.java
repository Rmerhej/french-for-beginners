package com.apprendrefr.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Limite le nombre d'inscriptions par adresse IP et par heure, pour éviter la création de comptes en masse.
 * Le seuil est volontairement large (20 par défaut) : plusieurs apprenants d'un même cours peuvent
 * s'inscrire ensemble depuis la même connexion Internet.
 */
@Component
public class RegistrationLimiter {

    private static final int MAX_ENTRIES = 10_000;

    private final int maxPerWindow;
    private final Duration window;
    private final Clock clock;
    private final ConcurrentHashMap<String, Window> windows = new ConcurrentHashMap<>();

    @Autowired
    public RegistrationLimiter(@Value("${app.security.register.max-per-hour:20}") int maxPerHour) {
        this(maxPerHour, Duration.ofHours(1), Clock.systemUTC());
    }

    RegistrationLimiter(int maxPerWindow, Duration window, Clock clock) {
        this.maxPerWindow = maxPerWindow;
        this.window = window;
        this.clock = clock;
    }

    /** Enregistre une inscription pour cette adresse ; renvoie false si la limite est atteinte. */
    public boolean tryAcquire(String ip) {
        String key = (ip == null || ip.isBlank()) ? "unknown" : ip;
        Instant now = clock.instant();
        if (windows.size() > MAX_ENTRIES) {
            windows.values().removeIf(w -> w.isExpired(now, window));
        }
        boolean[] allowed = new boolean[1];
        windows.compute(key, (k, existing) -> {
            Window current = (existing == null || existing.isExpired(now, window)) ? new Window(now) : existing;
            if (current.count < maxPerWindow) {
                current.count++;
                allowed[0] = true;
            }
            return current;
        });
        return allowed[0];
    }

    private static final class Window {
        private final Instant start;
        private int count;

        private Window(Instant start) {
            this.start = start;
        }

        private boolean isExpired(Instant now, Duration window) {
            return !now.isBefore(start.plus(window));
        }
    }
}
