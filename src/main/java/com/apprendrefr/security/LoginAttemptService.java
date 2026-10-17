package com.apprendrefr.security;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Limite les tentatives de connexion (protection contre le brute force).
 *
 * - Par nom d'utilisateur : maxAttemptsPerUser échecs consécutifs => blocage lockDuration.
 * - Par adresse IP : seuil plus haut (maxAttemptsPerIp), car plusieurs apprenants
 *   peuvent partager la même connexion (salle de cours).
 *
 * Les compteurs sont en mémoire : ils sont remis à zéro au redémarrage de l'application.
 */
@Service
public class LoginAttemptService {

    private static final int MAX_ENTRIES = 10_000;

    private final int maxAttemptsPerUser;
    private final int maxAttemptsPerIp;
    private final Duration lockDuration;
    private final Clock clock;

    private final ConcurrentHashMap<String, Counter> userCounters = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, Counter> ipCounters = new ConcurrentHashMap<>();

    @Autowired
    public LoginAttemptService(
            @Value("${app.security.login.max-attempts-per-user:5}") int maxAttemptsPerUser,
            @Value("${app.security.login.max-attempts-per-ip:20}") int maxAttemptsPerIp,
            @Value("${app.security.login.lock-minutes:15}") long lockMinutes) {
        this(maxAttemptsPerUser, maxAttemptsPerIp, Duration.ofMinutes(lockMinutes), Clock.systemUTC());
    }

    LoginAttemptService(int maxAttemptsPerUser, int maxAttemptsPerIp, Duration lockDuration, Clock clock) {
        this.maxAttemptsPerUser = maxAttemptsPerUser;
        this.maxAttemptsPerIp = maxAttemptsPerIp;
        this.lockDuration = lockDuration;
        this.clock = clock;
    }

    public void recordFailure(String username, String ip) {
        register(userCounters, userKey(username), maxAttemptsPerUser);
        register(ipCounters, ip == null ? "unknown" : ip, maxAttemptsPerIp);
    }

    /** Une connexion réussie remet à zéro le compteur de l'utilisateur. */
    public void recordSuccess(String username) {
        userCounters.remove(userKey(username));
    }

    public boolean isBlocked(String username, String ip) {
        return isLocked(userCounters, userKey(username))
                || isLocked(ipCounters, ip == null ? "unknown" : ip);
    }

    /**
     * Adresse du client. Nginx place l'IP réelle dans X-Real-IP (valeur qu'il écrase lui-même,
     * donc non falsifiable par le client) ; sinon on prend l'adresse de la connexion.
     */
    public static String clientIp(HttpServletRequest request) {
        String realIp = request.getHeader("X-Real-IP");
        if (realIp != null && !realIp.isBlank()) {
            return realIp.trim();
        }
        return request.getRemoteAddr();
    }

    private static String userKey(String username) {
        if (username == null) {
            return "";
        }
        String key = username.trim().toLowerCase(Locale.ROOT);
        return key.length() > 100 ? key.substring(0, 100) : key;
    }

    private void register(ConcurrentHashMap<String, Counter> map, String key, int max) {
        Instant now = clock.instant();
        if (map.size() > MAX_ENTRIES) {
            map.values().removeIf(c -> c.isExpired(now, lockDuration));
        }
        map.compute(key, (k, existing) -> {
            Counter c = (existing == null || existing.isExpired(now, lockDuration)) ? new Counter(now) : existing;
            c.count++;
            if (c.count >= max) {
                c.lockedUntil = now.plus(lockDuration);
            }
            return c;
        });
    }

    private boolean isLocked(ConcurrentHashMap<String, Counter> map, String key) {
        Counter c = map.get(key);
        if (c == null || c.lockedUntil == null) {
            return false;
        }
        if (clock.instant().isBefore(c.lockedUntil)) {
            return true;
        }
        map.remove(key, c);
        return false;
    }

    private static final class Counter {
        private final Instant windowStart;
        private int count;
        private Instant lockedUntil;

        private Counter(Instant windowStart) {
            this.windowStart = windowStart;
        }

        private boolean isExpired(Instant now, Duration window) {
            Instant end = lockedUntil != null ? lockedUntil : windowStart.plus(window);
            return !now.isBefore(end);
        }
    }
}