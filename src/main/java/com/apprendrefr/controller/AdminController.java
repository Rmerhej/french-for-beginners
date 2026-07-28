package com.apprendrefr.controller;

import com.apprendrefr.service.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final LessonService lessonService;

    private final UserService userService;

    private final ExerciseService exerciseService;

    private final VocabularyService vocabularyService;

    private final ThemeService themeService;

    private final ImageService imageService;

    private final QuizService quizService;

    private final PrononciationService prononciationService;

    OnlineUserService onlineUserService;

    VisitorTrackerService  visitorTrackerService;

    public AdminController(LessonService lessonService, UserService userService, QuizService quizService,
                           PrononciationService prononciationService, ExerciseService exerciseService, VocabularyService vocabularyService,
                           OnlineUserService onlineUserService,
                           VisitorTrackerService visitorTrackerService,ThemeService themeService,ImageService imageService) {
        this.lessonService = lessonService;
        this.userService = userService;
        this.exerciseService = exerciseService;
        this.vocabularyService = vocabularyService;
        this.quizService = quizService;
        this.prononciationService = prononciationService;
        this.onlineUserService = onlineUserService;
        this.visitorTrackerService = visitorTrackerService;
        this.themeService = themeService;
        this.imageService = imageService;
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
        model.addAttribute("onlineUsers", onlineUserService.getOnlineUsersCount());
        model.addAttribute("onlineVisitors", visitorTrackerService.getOnlineVisitors());
        return "admin/dashboard";
    }

    @GetMapping("/images/optimize")
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseBody
    public String launchImageOptimization() {

        String path = "uploads/images";
        imageService.batchProcessImages(path);
        return "Optimisation lancée sur le dossier : " + path;
    }

}