package com.apprendrefr.controller;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.service.QuizService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    /*#####################################*/


    @GetMapping("/LesArticlesDefinis")
    public String goToLesArticlesDefinis(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Les Articles définis - Grammaire"));

        return "LesArticlesDefinis-quiz-grammaire";
    }


    @GetMapping("/AdjectifsQualificatifs")
    public String goToAdjectifsQualificatifs(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Les adjectifs qualificatifs- Grammaire"));

        return "AdjectifsQualificatifs-quiz-grammaire";
    }

    @GetMapping("/PronomsPossessifesEtDemonstratifs")
    public String goToPronomsPossessifesEtDemonstratifs(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Pronoms possessifs et démonstratifs - Grammaire"));

        return "PronomsPossessifesEtDemonstratifs-quiz-grammaire";
    }

    @GetMapping("/LesAuxiliaresQuiz")
    public String goToLesAuxiliares(Model model) {
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase("Les auxiliaires - Grammaire"));

        return "LesAuxiliares-quiz-grammaire";
    }
    /*#####################################*/


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


    @GetMapping("/admin/quizzes")
    public String quizzes(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            Model model) {

        Pageable pageable = PageRequest.of(page, size);

        Page<Quiz> quizzesPage = quizService.searchQuizzes(keyword, pageable);

        model.addAttribute("quizzesPage", quizzesPage);
        model.addAttribute("quizzes", quizzesPage.getContent());
        model.addAttribute("keyword", keyword);

        return "admin/quizzes-list";
    }

    @GetMapping("/admin/quiz/create")
    public String showCreateQuizForm(Model model) {
        model.addAttribute("quiz", new Quiz());
        return "/admin/quiz-create";
    }

    @PostMapping("/admin/quiz/create")
    public String saveQuiz(@ModelAttribute Quiz quiz, RedirectAttributes redirectAttributes) {
        quizService.save(quiz);
        redirectAttributes.addFlashAttribute("success", "✅ Quiz créé !");
        return "redirect:/admin/quizzes";
    }

    @GetMapping("/admin/quiz/edit/{id}")
    public String showEditQuizForm(@PathVariable Long id, Model model) {
        Optional<Quiz> opt = quizService.findById(id);
        if (opt.isPresent()) {
            model.addAttribute("quiz", opt.get());
            return "admin/quiz-edit";
        }
        return "redirect:/admin/quizzes";
    }

    @PostMapping("/admin/quiz/edit/{id}")
    public String updateQuiz(@PathVariable Long id, @ModelAttribute Quiz quiz) {
        quiz.setId(id);
        quizService.save(quiz);
        return "redirect:/admin/quizzes";
    }

    @GetMapping("/admin/quiz/delete/{id}")
    public String deleteQuiz(@PathVariable Long id) {
        quizService.deleteById(id);
        return "redirect:/admin/quizzes";
    }

    @GetMapping("/admin/quiz/new")
    public String showCreateQuizForm1(Model model) {
        model.addAttribute("quiz", new Quiz());
        return "admin/quiz-create";
    }


}

