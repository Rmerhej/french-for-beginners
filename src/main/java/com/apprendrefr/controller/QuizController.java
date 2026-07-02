package com.apprendrefr.controller;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.repository.QuizRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Optional;

@Controller
public class QuizController {

    private final QuizRepository quizRepository;

    public QuizController(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }

    @GetMapping("/quizzesSurLaGrammaire")
   // public String listQuizzesForStudents(Model model) {
       // model.addAttribute("quizzes", quizRepository.findAll());
    public String goToquizSurLaGrammaire(){
        return "quiz-sur-la-grammaire";
    }
    @GetMapping("/prepositionConjonction")
     public String goToPrepositionConjonction(Model model) {
     model.addAttribute("quizzes", quizRepository.findByTitleContainingIgnoreCase("préposition"));
        model.addAttribute("quizzes", quizRepository.findByTitleContainingIgnoreCase("conjonction"));
        return "prepositionConjonction.html";
    }
    @GetMapping("/accords-des-adjectifs")
    public String goToLesPronoms(Model model) {
        model.addAttribute("quizzes", quizRepository.findByTitleContainingIgnoreCase("Accords des adjectifs"));

        return "accords-des-adjectifs";
    }
    @GetMapping("/les-adjectifs-accord-pluriel")
    public String goToLesAdjectifsAccordAuPluriel(Model model) {
        model.addAttribute("quizzes", quizRepository.findByTitleContainingIgnoreCase("Les Adjectifs(Accord au pluriel)"));

        return "les-adjectifs-accord-pluriel";
    }
    @GetMapping("/utilisation-des-pronoms")
    public String goToUtilisationDesPronoms(Model model) {
        model.addAttribute("quizzes", quizRepository.findByTitleContainingIgnoreCase("Les pronoms - Grammaire"));

        return "utilisation-des-pronoms";
    }
    @GetMapping("/expressions-de-temps")
    public String goToLesExpressionsDuTemps(Model model) {
        model.addAttribute("quizzes", quizRepository.findByTitleContainingIgnoreCase("Les Expressions de temps - Grammaire"));

        return "expressions-de-temps";
    }
    @GetMapping("/futur-simple")
    public String goToFuturSimple(Model model) {
        model.addAttribute("quizzes", quizRepository.findByTitleContainingIgnoreCase("Futur simple - Grammaire"));

        return "futur-simple-quiz-grammaire";
    }
    @GetMapping("/adjectifs-demonstratif")
    public String goToAdjectifsDemonstratif(Model model) {
        model.addAttribute("quizzes", quizRepository.findByTitleContainingIgnoreCase("Adjectifs démonstratifs - Grammaire"));

        return "adjectifs-demonstratifs-quiz-grammaire";
    }
    @GetMapping("/verbes-regulier")
    public String goToVerbesRegulier(Model model) {
        model.addAttribute("quizzes", quizRepository.findByTitleContainingIgnoreCase("Verbes réguliers"));

        return "verbes-regulier-quiz-grammaire";
    }


    @GetMapping("/quiz/{id}")
    public String showQuiz(@PathVariable Long id, Model model) {
        Optional<Quiz> opt = quizRepository.findById(id);
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

