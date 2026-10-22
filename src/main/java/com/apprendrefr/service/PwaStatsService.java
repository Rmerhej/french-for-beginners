package com.apprendrefr.service;

import com.apprendrefr.entity.PwaEvent;
import com.apprendrefr.repository.PwaEventRepository;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Compte les installations et les lancements de l'application (PWA).
 * Seuls des compteurs sont conservés : ni adresse IP, ni identifiant.
 */
@Service
public class PwaStatsService {

    public static final String INSTALLED = "INSTALLED";
    public static final String LAUNCHED = "LAUNCHED";

    private static final Set<String> TYPES = Set.of(INSTALLED, LAUNCHED);
    private static final Set<String> PLATFORMS = Set.of("ANDROID", "IOS", "DESKTOP", "OTHER");

    /** Un même appareil ne compte pas plusieurs fois le même événement dans cette durée. */
    private static final Duration THROTTLE = Duration.ofMinutes(30);

    private final PwaEventRepository repository;

    /** Mémoire temporaire (jamais écrite en base) pour limiter les envois répétés. */
    private final Map<String, Instant> lastSeen = new ConcurrentHashMap<>();

    public PwaStatsService(PwaEventRepository repository) {
        this.repository = repository;
    }

    public record PwaStats(long installedTotal,
                           long installedLast7Days,
                           long launchedTotal,
                           long launchedLast7Days,
                           long launchedLast30Days,
                           Map<String, Long> installedByPlatform,
                           Map<String, Long> launchedByPlatform) {
    }

    /**
     * @return false si le type d'événement est invalide ; true sinon
     *         (y compris quand l'envoi est ignoré car répété trop vite)
     */
    public boolean track(String type, String platform, String clientKey) {
        String eventType = type == null ? "" : type.trim().toUpperCase(Locale.ROOT);
        if (!TYPES.contains(eventType)) {
            return false;
        }
        String eventPlatform = platform == null ? "OTHER" : platform.trim().toUpperCase(Locale.ROOT);
        if (!PLATFORMS.contains(eventPlatform)) {
            eventPlatform = "OTHER";
        }

        Instant now = Instant.now();
        String key = clientKey + "|" + eventType;
        Instant previous = lastSeen.get(key);
        if (previous != null && previous.isAfter(now.minus(THROTTLE))) {
            return true;
        }
        lastSeen.put(key, now);
        if (lastSeen.size() > 5000) {
            lastSeen.values().removeIf(i -> i.isBefore(now.minus(THROTTLE)));
        }

        repository.save(new PwaEvent(eventType, eventPlatform, LocalDateTime.now()));
        return true;
    }

    public PwaStats stats() {
        LocalDateTime now = LocalDateTime.now();
        return new PwaStats(
                repository.countByEventType(INSTALLED),
                repository.countByEventTypeAndCreatedAtAfter(INSTALLED, now.minusDays(7)),
                repository.countByEventType(LAUNCHED),
                repository.countByEventTypeAndCreatedAtAfter(LAUNCHED, now.minusDays(7)),
                repository.countByEventTypeAndCreatedAtAfter(LAUNCHED, now.minusDays(30)),
                byPlatform(INSTALLED),
                byPlatform(LAUNCHED));
    }

    private Map<String, Long> byPlatform(String type) {
        Map<String, Long> result = new LinkedHashMap<>();
        result.put("Android", 0L);
        result.put("iPhone / iPad", 0L);
        result.put("Ordinateur", 0L);
        result.put("Autre", 0L);
        for (Object[] row : repository.countByPlatform(type)) {
            String label = switch (String.valueOf(row[0])) {
                case "ANDROID" -> "Android";
                case "IOS" -> "iPhone / iPad";
                case "DESKTOP" -> "Ordinateur";
                default -> "Autre";
            };
            result.merge(label, ((Number) row[1]).longValue(), Long::sum);
        }
        return result;
    }
}
