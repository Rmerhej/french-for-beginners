package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.QuizService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class LaFranceController {

    private final ExerciseService exerciseService;
    private final QuizService quizService;
    public LaFranceController(ExerciseService exerciseService,QuizService quizService) {
        this.exerciseService = exerciseService;
        this.quizService = quizService;
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
    public String goToprincipesEtValeursQUIZ(Model model) {

        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("principes et valeurs"));
        return "principesEtValeurs-QUIZ";
    }

    @GetMapping("/systemeInstEtPolitiqueQCM")
    public String goTosystemeInstEtPolitiqueQCM(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Système institutionnel et politique");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "systemeInstEtPolitique-QCM";
    }

    @GetMapping("/systemeInstEtPolitiqueQUIZ")
    public String goTosystemeInstEtPolitiqueQUIZ(Model model) {

        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("systeme institutionnel et politique"));
        return "systemeInstEtPolitique-QUIZ";
    }

    @GetMapping("/droitsEtDevoirsQCM")
    public String goTodroitsEtDevoirsQCM(Model model) {

        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Droits et devoirs");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "droitsEtDevoirs-QCM";
    }

    @GetMapping("/droitsEtDevoirsQUIZ")
    public String goTodroitsEtDevoirsQUIZ(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("droits et devoirs"));
        return "droitsEtDevoirs-QUIZ";
    }

    @GetMapping("/histoireGeoCultureQCM")
    public String goTohistoireGeoCultureQCM(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Histoire géographie et culture");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "histoireGeoCulture-QCM";
    }

    @GetMapping("/histoireGeoCultureQUIZ")
    public String goTohistoireGeoCultureQUIZ(Model model) {

        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("histoire geographie et culture"));
        return "histoireGeoCulture-QUIZ";
    }

    @GetMapping("/vivreDsSocieteFQCM")
    public String goTovivreDsSocieteFQCM(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Vivre dans la société française");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "vivreDsSocieteF-QCM";
    }

    @GetMapping("/vivreDsSocieteFQUIZ")
    public String goTovivreDsSocieteFQUIZ(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("vivre dans la societe française"));
        return "vivreDsSocieteF-QUIZ";
    }

}
