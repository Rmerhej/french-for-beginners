package com.apprendrefr.controller;

import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.ScoreService;
import com.apprendrefr.service.UserService;
import org.springframework.stereotype.Controller;

@Controller
public class ExerciseController {

    private final ExerciseService exerciseService;
    private final UserService userService;
    private final ScoreService scoreService;

    // injection automatique des 3 services
    public ExerciseController(ExerciseService exerciseService,
                              UserService userService,
                              ScoreService scoreService) {
        this.exerciseService = exerciseService;
        this.userService = userService;
        this.scoreService = scoreService;
    }
}