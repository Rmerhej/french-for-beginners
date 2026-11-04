package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Quiz;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.QuizService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class LaFranceController {

    /** Titres du QCM et du quiz généraux (les 5 modules réunis, comme à l'examen civique). */
    static final String GENERAL_QCM_TITLE = "Examen civique - QCM général";
    static final String GENERAL_QUIZ_TITLE = "Examen civique - Quiz général";

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

    /** QCM général : les questions des 5 modules, dans un ordre différent à chaque visite. */
    @GetMapping("/examenCiviqueQCM")
    public String goToExamenCiviqueQCM(Model model) {
        List<Exercise> exercises = new ArrayList<>(exerciseService.findByLessonTitleContaining(GENERAL_QCM_TITLE));
        Collections.shuffle(exercises);
        model.addAttribute("exercises", exercises);
        return "examenCivique-QCM";
    }

    /** Quiz général (glisser-déposer) : les phrases des 5 modules, dans un ordre différent à chaque visite. */
    @GetMapping("/examenCiviqueQUIZ")
    public String goToExamenCiviqueQUIZ(Model model) {
        List<Quiz> quizzes = new ArrayList<>(quizService.findByTitleContainingIgnoreCase(GENERAL_QUIZ_TITLE));
        Collections.shuffle(quizzes);
        model.addAttribute("quizzes", quizzes);
        return "examenCivique-QUIZ";
    }

}
