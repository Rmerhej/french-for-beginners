package com.apprendrefr.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

/**
 * Événement lié à l'application installée (PWA).
 * Aucune donnée personnelle : seulement le type, la plateforme et la date.
 */
@Entity
@Table(name = "pwa_events")
@Getter
@Setter
public class PwaEvent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** INSTALLED (application installée) ou LAUNCHED (ouverte depuis l'icône) */
    @Column(name = "event_type", nullable = false, length = 20)
    private String eventType;

    /** ANDROID, IOS, DESKTOP ou OTHER */
    @Column(name = "platform", nullable = false, length = 20)
    private String platform;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    public PwaEvent() {
    }

    public PwaEvent(String eventType, String platform, LocalDateTime createdAt) {
        this.eventType = eventType;
        this.platform = platform;
        this.createdAt = createdAt;
    }
}
