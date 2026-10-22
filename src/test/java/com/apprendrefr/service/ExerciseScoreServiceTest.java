package com.apprendrefr.service;

import com.apprendrefr.entity.Exercise;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class ExerciseScoreServiceTest {

    private static Exercise exercise(String correct) {
        Exercise e = new Exercise();
        e.setOptionA("est");
        e.setOptionB(" sont");
        e.setOptionC("suis");
        e.setOptionD("êtes");
        e.setCorrectAnswer(correct);
        return e;
    }

    @Test
    void letterAgainstLetter() {
        assertTrue(ExerciseScoreService.isCorrect(exercise("B"), "B"));
        assertTrue(ExerciseScoreService.isCorrect(exercise("B"), "b"));
        assertFalse(ExerciseScoreService.isCorrect(exercise("B"), "A"));
    }

    @Test
    void textAgainstText() {
        assertTrue(ExerciseScoreService.isCorrect(exercise("suis"), "suis"));
        assertFalse(ExerciseScoreService.isCorrect(exercise("suis"), "est"));
    }

    @Test
    void letterAgainstText_andTextAgainstLetter() {
        assertTrue(ExerciseScoreService.isCorrect(exercise("C"), "suis"));
        assertTrue(ExerciseScoreService.isCorrect(exercise("suis"), "C"));
        assertFalse(ExerciseScoreService.isCorrect(exercise("C"), "est"));
    }

    @Test
    void leadingSpaceInData_isIgnored() {
        assertTrue(ExerciseScoreService.isCorrect(exercise("B"), "sont"));
        assertTrue(ExerciseScoreService.isCorrect(exercise("sont"), " sont "));
    }

    @Test
    void duplicateOptions_stillWork() {
        Exercise e = exercise("A");
        e.setOptionB("est");
        assertTrue(ExerciseScoreService.isCorrect(e, "est"));
        assertTrue(ExerciseScoreService.isCorrect(e, "B"));
    }

    @Test
    void emptyOrNullAnswer_isWrong() {
        assertFalse(ExerciseScoreService.isCorrect(exercise("B"), null));
        assertFalse(ExerciseScoreService.isCorrect(exercise("B"), "  "));
        assertFalse(ExerciseScoreService.isCorrect(exercise(null), "A"));
    }

    @Test
    void normalize_collapsesSpacesAndCase() {
        assertEquals("a b", ExerciseScoreService.normalize("  A   B "));
    }
}
