package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.service.ExerciseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class LaFranceController {

    private final ExerciseService exerciseService;

    public LaFranceController(ExerciseService exerciseService) {
        this.exerciseService = exerciseService;
    }

    @GetMapping("/laFrance")
    public String goToLaFrance() {
        return "laFrance-index";
    }

    @GetMapping("/principesEtValeursQCM")
    public String goToprincipesEtValeursQCM(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Principes et valeurs de la République");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());

        return "principesEtValeurs-QCM";
    }

    @GetMapping("/principesEtValeursQUIZ")
    public String goToprincipesEtValeursQUIZ() {
        return "principesEtValeurs-QUIZ";
    }

    @GetMapping("/systemeInstEtPolitiqueQCM")
    public String goTosystemeInstEtPolitiqueQCM(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Système institutionnel et politique");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "systemeInstEtPolitique-QCM";
    }

    @GetMapping("/systemeInstEtPolitiqueQUIZ")
    public String goTosystemeInstEtPolitiqueQUIZ() {


        return "systemeInstEtPolitique-QUIZ";
    }

    @GetMapping("/droitsEtDevoirsQCM")
    public String goTodroitsEtDevoirsQCM(Model model) {

        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Droits et devoirs");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "droitsEtDevoirs-QCM";
    }

    @GetMapping("/droitsEtDevoirsQUIZ")
    public String goTodroitsEtDevoirsQUIZ() {
        return "droitsEtDevoirs-QUIZ";
    }

    @GetMapping("/histoireGeoCultureQCM")
    public String goTohistoireGeoCultureQCM(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Histoire géographie et culture");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "histoireGeoCulture-QCM";
    }

    @GetMapping("/histoireGeoCultureQUIZ")
    public String goTohistoireGeoCultureQUIZ() {
        return "histoireGeoCulture-QUIZ";
    }

    @GetMapping("/vivreDsSocieteFQCM")
    public String goTovivreDsSocieteFQCM(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Vivre dans la société française");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "vivreDsSocieteF-QCM";
    }

    @GetMapping("/vivreDsSocieteFQUIZ")
    public String goTovivreDsSocieteFQUIZ() {
        return "vivreDsSocieteF-QUIZ";
    }

}
