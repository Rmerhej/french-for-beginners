package com.apprendrefr.controller;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.repository.QuizRepository;
import com.apprendrefr.service.QuizService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Optional;

@Controller
public class QuizController {

    private final QuizService quizService;

    public QuizController(QuizService quizService) {
        this.quizService = quizService;
    }

    @GetMapping("/quizzesSurLaGrammaire")
    public String goToquizSurLaGrammaire() {
        return "quiz-sur-la-grammaire";
    }

    @GetMapping("/prepositionConjonction")
    public String goToPrepositionConjonction(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("préposition"));
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("conjonction"));
        return "prepositionConjonction";
    }

    @GetMapping("/accords-des-adjectifs")
    public String goToLesPronoms(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Accords des adjectifs"));

        return "accords-des-adjectifs";
    }

    @GetMapping("/les-adjectifs-accord-pluriel")
    public String goToLesAdjectifsAccordAuPluriel(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Les Adjectifs(Accord au pluriel)"));

        return "les-adjectifs-accord-pluriel";
    }

    @GetMapping("/utilisation-des-pronoms")
    public String goToUtilisationDesPronoms(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Les pronoms - Grammaire"));

        return "utilisation-des-pronoms";
    }

    @GetMapping("/expressions-de-temps")
    public String goToLesExpressionsDuTemps(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Les Expressions de temps - Grammaire"));

        return "expressions-de-temps";
    }

    @GetMapping("/futur-simple")
    public String goToFuturSimple(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Futur simple - Grammaire"));

        return "futur-simple-quiz-grammaire";
    }

    @GetMapping("/adjectifs-demonstratif")
    public String goToAdjectifsDemonstratif(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Adjectifs démonstratifs - Grammaire"));

        return "adjectifs-demonstratifs-quiz-grammaire";
    }

    @GetMapping("/verbes-regulier")
    public String goToVerbesRegulier(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Verbes réguliers"));

        return "verbes-regulier-quiz-grammaire";
    }


    @GetMapping("/quiz/{id}")
    public String showQuiz(@PathVariable Long id, Model model) {
        Optional<Quiz> opt = quizService.findById(id);
        if (opt.isPresent()) {
            Quiz quiz = opt.get();
            model.addAttribute("quiz", quiz);
            model.addAttribute("words", quiz.getWords().split(","));
            model.addAttribute("correctAnswers", quiz.getCorrectAnswers().split(","));
            return "quiz";
        }
        return "redirect:/quizzes";
    }
}

