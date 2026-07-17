package com.apprendrefr.controller;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PreparationQuizController {

    @Autowired
    private QuizService quizService;

    @GetMapping({"/preparation-quiz-index"})
    public String showQuizList() {
        return "preparationQuiz-list";
    }

    @GetMapping({"/preparation-quiz-lesson-vers-index"})
    public String showQuizListFromLesson() {
        return "preparationQuiz-list";
    }

    @GetMapping("/togoToAuBureuQuiz")
    public String showAuBureauQuiz(Model model) {
        List<Quiz> quizzes = quizService.findByTitleContaining("Au Bureau");
        model.addAttribute("quizzes", quizzes != null ? quizzes : new ArrayList<>());
        return "au-bureau-quiz";
    }

    @GetMapping("/lesgensquiz")
    public String showAuLesGensQuiz(Model model) {
        List<Quiz> quizzes = quizService.findByTitleContaining("Les gens");
        model.addAttribute("quizzes", quizzes != null ? quizzes : new ArrayList<>());
        return "les-gens-quiz";
    }

    @GetMapping("/lesportquiz")
    public String showLeSportQuiz(Model model) {
        List<Quiz> quizzes = quizService.findByTitleContaining("Le sport");
        model.addAttribute("quizzes", quizzes != null ? quizzes : new ArrayList<>());
        return "le-sport-quiz";
    }

    @GetMapping("/entrepriseQuiz")
    public String showEntrepriseQuiz(Model model) {
        List<Quiz> quizzes = quizService.findByTitleContaining("Entreprise");
        model.addAttribute("quizzes", quizzes != null ? quizzes : new ArrayList<>());
        return "entreprise-quiz";
    }
}