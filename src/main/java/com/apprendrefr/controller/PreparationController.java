package com.apprendrefr.controller;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PreparationController {

    @Autowired
    private ExerciseService exerciseService;

    @Autowired
    private QuizService quizService;

    @GetMapping("/preparation")
    public String preparation() {
        return "preparation";
    }

    @GetMapping("/aubureau")
    public String getQuizPage(
            @RequestParam(name = "exTitle", required = false) String exTitle,
            @RequestParam(name = "quizTitle", required = false) String quizTitle,
            Model model) {

        // 1. Exercises: Use service logic to return empty list if none found
        model.addAttribute("exercises", (exTitle != null && !exTitle.isEmpty())
                ? exerciseService.findByLessonTitle(exTitle)
                : exerciseService.findAll());

        // 2. Quiz: Service returns a valid Quiz or a new Quiz() object
        // No need for .orElse() here if the service handles it internally
        model.addAttribute("quiz", (quizTitle != null && !quizTitle.isEmpty())
                ? quizService.findByTitle(quizTitle)
                : quizService.getFirstQuiz());

        return "au-bureau";
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