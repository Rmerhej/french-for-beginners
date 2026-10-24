package com.apprendrefr.controller;

import com.apprendrefr.repository.UserRepository;
import com.apprendrefr.service.ParcoursService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Locale;

/** Enregistre le niveau obtenu au test de positionnement (utilisateur connecté obligatoire). */
@Controller
public class PlacementController {

    private final UserRepository userRepository;

    public PlacementController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping("/evaluation/niveau")
    public ResponseEntity<Void> save(@RequestParam("niveau") String niveau, Principal principal) {
        String code = niveau.trim().toUpperCase(Locale.ROOT);
        if (!ParcoursService.CODES.contains(code)) {
            return ResponseEntity.badRequest().build();
        }
        return userRepository.findByUsername(principal.getName())
                .map(user -> {
                    user.setPlacementLevel(code);
                    userRepository.save(user);
                    return ResponseEntity.noContent().<Void>build();
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }
}
