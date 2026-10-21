package com.apprendrefr.controller;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.service.QuizService;
import com.apprendrefr.util.AdminPaging;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
public class QuizController {

    private final QuizService quizService;

    public QuizController(QuizService quizService) {
        this.quizService = quizService;
    }

    /*@GetMapping("/quizzesSurLaGrammaire")
    public String goToquizSurLaGrammaire() {
        return "quiz-sur-la-grammaire";
    }*/



    @GetMapping("/quiz/drag-drop")
    public String afficherQuiz(
            @RequestParam String recherche,
            Model model) {

        List<Quiz> quizzes =
                quizService.findByTitleContainingIgnoreCase(recherche);

        model.addAttribute("quizzes", quizzes);
        model.addAttribute("titre", recherche);

        return "quiz-drag-drop";
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


    @GetMapping("/admin/quizzes")
    public String quizzes(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            Model model) {

        Pageable pageable = AdminPaging.newestFirst(page, size);

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

    @PostMapping("/admin/quiz/delete/{id}")
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

