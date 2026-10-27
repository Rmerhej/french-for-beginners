package com.apprendrefr.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

/**
 * Mémoire des dernières connexions et déconnexions (affichée sur le tableau de bord).
 * Elle est gardée en mémoire seulement : elle repart de zéro au redémarrage de l'application.
 */
@Component
public class ActivityLog {

    public enum Type {
        LOGIN("Connexion", "bg-success"),
        AUTO_LOGIN("Reconnexion automatique", "bg-info"),
        LOGOUT("Déconnexion", "bg-warning text-dark"),
        EXPIRED("Session expirée", "bg-secondary");

        private final String label;
        private final String badge;

        Type(String label, String badge) {
            this.label = label;
            this.badge = badge;
        }

        public String getLabel() {
            return label;
        }

        public String getBadge() {
            return badge;
        }
    }

    public static final class Entry {
        private final Instant at;
        private final String time;
        private final String username;
        private final Type type;

        private Entry(Instant at, String time, String username, Type type) {
            this.at = at;
            this.time = time;
            this.username = username;
            this.type = type;
        }

        public String getTime() {
            return time;
        }

        public String getUsername() {
            return username;
        }

        public Type getType() {
            return type;
        }

        public String getLabel() {
            return type.getLabel();
        }

        public String getBadge() {
            return type.getBadge();
        }
    }

    static final int MAX_ENTRIES = 50;
    /** Une déconnexion volontaire provoque aussi la fin de la session : on n'affiche qu'une ligne. */
    private static final Duration MERGE_WINDOW = Duration.ofSeconds(5);
    private static final DateTimeFormatter FORMAT =
            DateTimeFormatter.ofPattern("dd/MM HH:mm:ss").withZone(ZoneId.of("Europe/Paris"));

    private final Deque<Entry> entries = new ArrayDeque<>(); // la plus récente en premier
    private final Clock clock;

    @Autowired
    public ActivityLog() {
        this(Clock.systemUTC());
    }

    ActivityLog(Clock clock) {
        this.clock = clock;
    }

    public synchronized void record(String username, Type type) {
        if (username == null || username.isBlank() || type == null) {
            return;
        }
        Instant now = clock.instant();
        Entry last = lastEntryOf(username);
        if (last != null && Duration.between(last.at, now).compareTo(MERGE_WINDOW) <= 0) {
            if (type == Type.EXPIRED && last.type == Type.LOGOUT) {
                return; // la session qui se ferme après un clic sur « Déconnexion »
            }
            if (type == Type.LOGOUT && last.type == Type.EXPIRED) {
                entries.remove(last); // c'était en réalité une déconnexion volontaire
            }
        }
        entries.addFirst(new Entry(now, FORMAT.format(now), username, type));
        while (entries.size() > MAX_ENTRIES) {
            entries.removeLast();
        }
    }

    /** Les dernières entrées, la plus récente en premier. */
    public synchronized List<Entry> recent() {
        return new ArrayList<>(entries);
    }

    private Entry lastEntryOf(String username) {
        for (Entry e : entries) {
            if (e.username.equals(username)) {
                return e;
            }
        }
        return null;
    }
}
