package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.User;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.ScoreService;
import com.apprendrefr.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;

@Controller
public class ScoreController {

    private final ExerciseService exerciseService;
    private final UserService userService;
    private final ScoreService scoreService;

    public ScoreController(ExerciseService exerciseService, UserService userService, ScoreService scoreService) {
        this.exerciseService = exerciseService;
        this.userService = userService;
        this.scoreService = scoreService;
    }

    @PostMapping("/exercise/submit/{id}")
    @ResponseBody
    public ResponseEntity<?> submitExercise(@PathVariable Long id,
                                            @RequestParam(required = false) String userAnswer,
                                            Principal principal) {

        //  Vérification utilisateur connecté
        if (principal == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Utilisateur non connecté");
        }

        //  Vérification réponse envoyée
        if (userAnswer == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("La réponse envoyée est vide.");
        }

        try {
            //  Récupération de l'exercice
            Exercise exercise = exerciseService.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("Exercice introuvable : " + id));

            //  Récupération de l'utilisateur
            String currentUsername = principal.getName();
            User user = userService.findByUsername(currentUsername)
                    .orElseThrow(() -> new IllegalArgumentException("Utilisateur introuvable : " + currentUsername));

            //  Calcul du score
            int points = 0;
            if (exercise.getCorrectAnswer() != null &&
                    exercise.getCorrectAnswer().equalsIgnoreCase(userAnswer.trim())) {
                points = 100;
            }

            //  Sauvegarde via le service

            scoreService.saveScore(user, exercise, points);

            return ResponseEntity.ok("Score enregistré avec succès !");

        } catch (Exception e) {
            System.err.println("💥 CRASH DANS LE SCORECONTROLLER : " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Erreur : " + e.getMessage());
        }
    }
}