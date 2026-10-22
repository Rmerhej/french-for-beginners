package com.apprendrefr.service;

import com.apprendrefr.entity.PwaEvent;
import com.apprendrefr.repository.PwaEventRepository;
import org.springframework.stereotype.Service;

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

    /**
     * Protection contre les abus : au plus 30 événements par minute et par adresse.
     * Beaucoup de personnes peuvent partager la même adresse (famille, classe) :
     * on ne dédoublonne donc pas, on limite seulement le débit.
     */
    private static final int MAX_EVENTS_PER_MINUTE = 30;

    private final PwaEventRepository repository;

    /** Mémoire temporaire (jamais écrite en base) : [minute, nombre d'événements] par adresse. */
    private final Map<String, long[]> rates = new ConcurrentHashMap<>();

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
     *         (y compris quand l'envoi est ignoré car le débit est trop élevé)
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

        if (!allowed(clientKey)) {
            return true;
        }

        repository.save(new PwaEvent(eventType, eventPlatform, LocalDateTime.now()));
        return true;
    }

    private boolean allowed(String clientKey) {
        long minute = Instant.now().getEpochSecond() / 60;
        boolean[] ok = {true};
        rates.compute(clientKey, (k, w) -> {
            if (w == null || w[0] != minute) {
                return new long[]{minute, 1};
            }
            if (w[1] >= MAX_EVENTS_PER_MINUTE) {
                ok[0] = false;
                return w;
            }
            w[1]++;
            return w;
        });
        if (rates.size() > 5000) {
            rates.values().removeIf(w -> w[0] < minute);
        }
        return ok[0];
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
