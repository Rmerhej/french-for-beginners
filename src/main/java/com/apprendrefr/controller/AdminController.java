package com.apprendrefr.controller;

import com.apprendrefr.service.*;
import jakarta.annotation.security.PermitAll;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private LessonService lessonService;
    @Autowired
    private UserService userService;
    @Autowired
    private ExerciseService exerciseService;
    @Autowired
    private VocabularyService vocabularyService;
    @Autowired
    private ThemeService themeService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private QuizService quizService;
    @Autowired
    private PrononciationService prononciationService;

    public AdminController(LessonService lessonService, UserService userService, QuizService quizService,
                           PrononciationService prononciationService, ExerciseService exerciseService, VocabularyService vocabularyService) {
        this.lessonService = lessonService;
        this.userService = userService;
        this.exerciseService = exerciseService;
        this.vocabularyService = vocabularyService;
        this.quizService = quizService;
        this.prononciationService = prononciationService;
    }

    @GetMapping
    public String adminHome() {
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {

        long lessons = lessonService.count();
        long users = userService.count();
        long exercises = exerciseService.count();
        long vocabularies = vocabularyService.count();
        long quizzes = quizService.count();
        long themes = themeService.count();
        long prononciations = prononciationService.count();

        //  Passage des variables locales au modèle Thymeleaf
        model.addAttribute("lessonsCount", lessons);
        model.addAttribute("usersCount", users);
        model.addAttribute("exercisesCount", exercises);
        model.addAttribute("vocabularyCount", vocabularies);
        model.addAttribute("quizzesCount", quizzes);
        model.addAttribute("themesCount", themes);
        model.addAttribute("prononciationsCount", prononciations);
        return "admin/dashboard";
    }

    @GetMapping("/images/optimize")
    @PermitAll
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseBody
    public String launchImageOptimization() {

        String path = "uploads/images";
        imageService.batchProcessImages(path);
        return "Optimisation lancée sur le dossier : " + path;
    }

}