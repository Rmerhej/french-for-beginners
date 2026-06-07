package com.apprendrefr.controller;

import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.UserService;
import com.apprendrefr.service.ScoreService;
import org.springframework.stereotype.Controller;

@Controller
public class ExerciseController {

    // 1. Déclaration des variables (attributs de la classe)
    private final ExerciseService exerciseService;
    private final UserService userService;
    private final ScoreService scoreService;

    // 2. Initialisation unique via le constructeur
    // C'est ici que Spring injecte automatiquement les 3 services d'un coup
    public ExerciseController(ExerciseService exerciseService,
                              UserService userService,
                              ScoreService scoreService) {
        this.exerciseService = exerciseService;
        this.userService = userService;
        this.scoreService = scoreService;
    }
}