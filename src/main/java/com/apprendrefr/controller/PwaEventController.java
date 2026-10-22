package com.apprendrefr.controller;

import com.apprendrefr.security.LoginAttemptService;
import com.apprendrefr.service.PwaStatsService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Reçoit les événements de l'application installée (voir static/js/pwa-register.js).
 * L'adresse /visitor/** est publique et exclue du CSRF (comme le suivi des visiteurs).
 */
@RestController
public class PwaEventController {

    private final PwaStatsService pwaStatsService;

    public PwaEventController(PwaStatsService pwaStatsService) {
        this.pwaStatsService = pwaStatsService;
    }

    @PostMapping("/visitor/pwa-event")
    public ResponseEntity<Void> receive(@RequestParam("type") String type,
                                        @RequestParam(value = "p", required = false) String platform,
                                        HttpServletRequest request) {

        boolean accepted = pwaStatsService.track(type, platform, LoginAttemptService.clientIp(request));

        return accepted ? ResponseEntity.noContent().build() : ResponseEntity.badRequest().build();
    }
}
