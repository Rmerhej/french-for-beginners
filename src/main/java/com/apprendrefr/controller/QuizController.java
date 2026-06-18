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

    @GetMapping("/quizzes")
    public String listQuizzesForStudents(Model model) {
        model.addAttribute("quizzes", quizRepository.findAll());
        return "quizzes-student";
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

