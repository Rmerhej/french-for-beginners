package com.apprendrefr.controller;

import com.apprendrefr.service.ExerciseScoreService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Scores des QCM. Toutes ces adresses exigent d'être connecté (voir SecurityConfig).
 */
@Controller
public class ExerciseScoreController {

    private static final int MAX_ANSWER_LENGTH = 500;

    private final ExerciseScoreService scoreService;
    private final com.apprendrefr.service.QuizScoreService quizScoreService;

    public ExerciseScoreController(ExerciseScoreService scoreService,
                                   com.apprendrefr.service.QuizScoreService quizScoreService) {
        this.scoreService = scoreService;
        this.quizScoreService = quizScoreService;
    }

    /** Reçoit une réponse, la corrige et l'enregistre. */
    @PostMapping("/exercise/submit/{id}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> submit(@PathVariable("id") Long exerciseId,
                                                      @RequestParam("userAnswer") String userAnswer,
                                                      Principal principal) {
        if (userAnswer.length() > MAX_ANSWER_LENGTH) {
            return ResponseEntity.badRequest().build();
        }
        return scoreService.submit(principal.getName(), exerciseId, userAnswer)
                .map(result -> {
                    Map<String, Object> body = new LinkedHashMap<>();
                    body.put("correct", result.correct());
                    body.put("correctAnswer", result.correctAnswer());
                    return ResponseEntity.ok(body);
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    /**
     * Exercices déjà réussis / déjà tentés (pour afficher les repères sur les pages),
     * et jeton CSRF à utiliser pour l'envoi des réponses.
     */
    @GetMapping("/exercise/my-results")
    @ResponseBody
    public Map<String, Object> myResults(Principal principal, CsrfToken csrfToken) {
        Map<String, Object> body = new LinkedHashMap<>();
        body.put("successfulIds", scoreService.successfulExerciseIds(principal.getName()));
        body.put("attemptedIds", scoreService.attemptedExerciseIds(principal.getName()));
        if (csrfToken != null) {
            Map<String, String> csrf = new LinkedHashMap<>();
            csrf.put("headerName", csrfToken.getHeaderName());
            csrf.put("parameterName", csrfToken.getParameterName());
            csrf.put("token", csrfToken.getToken());
            body.put("csrf", csrf);
        }
        return body;
    }

    /** Page « Mes résultats ». */
    @GetMapping("/mes-resultats")
    public String myResultsPage(Principal principal, Model model) {
        model.addAttribute("results", scoreService.myResults(principal.getName()));
        model.addAttribute("quizResults", quizScoreService.summary(principal.getName()));
        return "mes-resultats";
    }
}
