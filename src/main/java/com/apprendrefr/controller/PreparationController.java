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

    @GetMapping("/preparation-list-index")
    public String redirectFromIndex() {
        return "preparation-list";
    }
    // Point d'entrée principal pour la leçon "Au Bureau"
    @GetMapping("/lessons/preparation-list")
    public String getAuBureauPage(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Au Bureau");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "preparation-list";
    }

    @GetMapping("/togoToAuBureu")
    public String redirectFromPreparationList(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Au Bureau");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "au-bureau";
    }

    @GetMapping("/lesgens")
    public String allerLesGens(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Les gens");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "les-gens";
    }

    @GetMapping("/lesport")
    public String allerLeSport(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Le sport");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "le-sport";
    }
}