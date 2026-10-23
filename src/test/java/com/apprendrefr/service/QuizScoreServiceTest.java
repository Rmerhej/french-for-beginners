package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class QuizScoreServiceTest {

    @Test
    void allCorrect() {
        var r = QuizScoreService.grade("est, sont", List.of("est", "sont"));
        assertEquals(2, r.score());
        assertEquals(2, r.total());
    }

    @Test
    void partialAndEmptyZones() {
        var r = QuizScoreService.grade("est,sont,suis", List.of("est", "", "x"));
        assertEquals(1, r.score());
        assertEquals(3, r.total());
    }

    @Test
    void missingAnswersCountAsWrong() {
        var r = QuizScoreService.grade("est,sont", List.of("est"));
        assertEquals(1, r.score());
        assertEquals(2, r.total());
    }

    @Test
    void fold_ignoresCaseAccentsAndCurlyApostrophe() {
        assertEquals("l'opposition et la concession", QuizScoreService.fold("L\u2019Opposition et la Concession"));
        assertEquals("passe compose", QuizScoreService.fold("Passé Composé"));
    }

    @Test
    void noCorrectAnswersDefined() {
        var r = QuizScoreService.grade(null, List.of("a"));
        assertEquals(0, r.score());
        assertEquals(0, r.total());
    }
}
