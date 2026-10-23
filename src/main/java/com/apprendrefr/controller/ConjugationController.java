package com.apprendrefr.controller;

import com.apprendrefr.service.ConjugationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ConjugationController {

    private final ConjugationService conjugationService;

    public ConjugationController(ConjugationService conjugationService) {
        this.conjugationService = conjugationService;
    }

    @GetMapping("/conjugueur")
    public String conjugueur(@RequestParam(required = false) String verbe, Model model) {
        model.addAttribute("verbes", conjugationService.knownVerbs());
        if (verbe != null && !verbe.isBlank()) {
            String recherche = verbe.trim();
            model.addAttribute("recherche", recherche);
            conjugationService.conjugate(recherche)
                    .ifPresentOrElse(c -> model.addAttribute("conjugaison", c),
                            () -> model.addAttribute("introuvable", true));
        }
        return "conjugueur";
    }
}
