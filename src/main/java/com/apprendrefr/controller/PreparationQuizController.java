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

    // Fusion des deux méthodes identiques en une seule
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

        // Log the contents to identify if there are nulls inside the list
        if (quizzes != null) {
            for (int i = 0; i < quizzes.size(); i++) {
                System.out.println("Quiz[" + i + "]: " + (quizzes.get(i) == null ? "NULL" : quizzes.get(i).getTitle()));
            }
        }
        // Debug: Print every object in the list
        for (Quiz q : quizzes) {
            if (q == null) {
                System.out.println("FOUND A NULL OBJECT IN THE LIST!");
            } else {
                System.out.println("Quiz found: " + q.getTitle() + " | Sentence: " + q.getSentence());
            }
        }
        model.addAttribute("quizzes", quizzes != null ? quizzes : new ArrayList<>());
        System.out.println("Object type: " + model.getAttribute("quizzes").getClass().getName());

        return "au-bureau-quiz";
    }
}