package com.apprendrefr.controller;

import com.apprendrefr.service.QuizScoreService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

/** Scores des quiz glisser-déposer (utilisateur connecté obligatoire). */
@Controller
public class QuizScoreController {

    private static final int MAX_LENGTH = 2000;

    private final QuizScoreService scoreService;

    public QuizScoreController(QuizScoreService scoreService) {
        this.scoreService = scoreService;
    }

    /** answers : réponses séparées par « | », dans l'ordre des zones à remplir. */
    @PostMapping("/quiz/submit/{id}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> submit(@PathVariable("id") Long quizId,
                                                      @RequestParam("answers") String answers,
                                                      Principal principal) {
        if (answers.length() > MAX_LENGTH) {
            return ResponseEntity.badRequest().build();
        }
        return scoreService.submit(principal.getName(), quizId, Arrays.asList(answers.split("\\|", -1)))
                .map(r -> {
                    Map<String, Object> body = new LinkedHashMap<>();
                    body.put("score", r.score());
                    body.put("total", r.total());
                    return ResponseEntity.ok(body);
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping("/quiz/my-results")
    @ResponseBody
    public Map<String, Object> myResults(Principal principal) {
        Map<String, Object> body = new LinkedHashMap<>();
        body.put("perfectIds", scoreService.perfectQuizIds(principal.getName()));
        body.put("attemptedIds", scoreService.attemptedQuizIds(principal.getName()));
        return body;
    }
}
