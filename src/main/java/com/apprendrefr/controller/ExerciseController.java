package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.LessonService;
import com.apprendrefr.service.ScoreService;
import com.apprendrefr.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ExerciseController {

    private final ExerciseService exerciseService;
    private final UserService userService;
    private final ScoreService scoreService;
    private final LessonService lessonService;

    // injection automatique des 3 services
    public ExerciseController(ExerciseService exerciseService,
                              UserService userService,
                              ScoreService scoreService, LessonService lessonService) {
        this.exerciseService = exerciseService;
        this.userService = userService;
        this.scoreService = scoreService;
        this.lessonService = lessonService;
    }

    @GetMapping("/culture")
    public String getCulturePage(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Culture");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "culture";
    }
}