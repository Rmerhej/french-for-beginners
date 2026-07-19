package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Quiz;
import com.apprendrefr.service.ExerciseService;
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

    @GetMapping("/lessons/preparation-list")
    public String getAuBureauPage(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Au Bureau");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "preparation-list";
    }
    @GetMapping("/admin/preparation/new")
    public String showCreatePreparationForm(Exercise exercise, Quiz quiz, Model model) {
        model.addAttribute("quiz", new Quiz());
        model.addAttribute("exercise", exercise);

        return "admin/preparation-form-create";
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

    @GetMapping("/entreprise")
    public String allerAEntreprise(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Entreprise");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "entreprise-qcm";
    }
}