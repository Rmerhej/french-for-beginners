package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PreparationController {

    @Autowired
    private ExerciseService exerciseService;

    @Autowired
    private QuizService quizService;

    @GetMapping("/preparation-list-index")
    public String redirectFromIndex() {
        return "redirect:/lessons/preparation-list";
    }
    // Point d'entrée principal pour la leçon "Au Bureau"
    @GetMapping("/lessons/preparation-list")
    public String getAuBureauPage(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Au Bureau");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        model.addAttribute("quizzes", quizService.findAll());
        return "au-bureau";
    }

    // Simplification des accès :
    // Si vous tapez /preparation-list, on redirige proprement vers la page correcte
    @GetMapping("/preparation-list")
    public String redirectToPreparation() {
        return "redirect:/lessons/preparation-list";
    }

    @GetMapping("/lesgens")
    public String allerLesGens() {
        return "les-gens";
    }

    @GetMapping("/lesport")
    public String allerLeSport() {
        return "le-sport";
    }
}