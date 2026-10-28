package com.apprendrefr.controller;

import com.apprendrefr.security.ActivityLog;
import com.apprendrefr.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final LessonService lessonService;

    private final UserService userService;

    private final ExerciseService exerciseService;

    private final VocabularyService vocabularyService;

    private final ThemeService themeService;

    private final QuizService quizService;

    private final PrononciationService prononciationService;

    OnlineUserService onlineUserService;

    VisitorTrackerService  visitorTrackerService;

    private final PwaStatsService pwaStatsService;

    private final ActivityLog activityLog;

    public AdminController(LessonService lessonService, UserService userService, QuizService quizService,
                           PrononciationService prononciationService, ExerciseService exerciseService, VocabularyService vocabularyService,
                           OnlineUserService onlineUserService,
                           VisitorTrackerService visitorTrackerService,ThemeService themeService,
                           PwaStatsService pwaStatsService, ActivityLog activityLog) {
        this.lessonService = lessonService;
        this.userService = userService;
        this.exerciseService = exerciseService;
        this.vocabularyService = vocabularyService;
        this.quizService = quizService;
        this.prononciationService = prononciationService;
        this.onlineUserService = onlineUserService;
        this.visitorTrackerService = visitorTrackerService;
        this.themeService = themeService;
        this.pwaStatsService = pwaStatsService;
        this.activityLog = activityLog;
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
        model.addAttribute("onlineUsernames", onlineUserService.getOnlineUsernames());
        model.addAttribute("recentActivity", activityLog.recent());
        model.addAttribute("onlineVisitors", visitorTrackerService.getOnlineVisitors());
        model.addAttribute("pwaStats", pwaStatsService.stats());
        return "admin/dashboard";
    }

}