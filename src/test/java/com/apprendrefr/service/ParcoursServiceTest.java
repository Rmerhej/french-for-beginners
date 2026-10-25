package com.apprendrefr.service;

import com.apprendrefr.dto.ParcoursNiveau;
import com.apprendrefr.service.QuizScoreService.Progress;
import com.apprendrefr.service.ParcoursService.Suivi;
import org.junit.jupiter.api.Test;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class ParcoursServiceTest {

    private final QuizScoreService scores = mock(QuizScoreService.class);
    private final ParcoursService service = new ParcoursService(scores);

    private Map<String, Progress> progres(int doneFirst) {
        Map<String, Progress> map = new LinkedHashMap<>();
        int i = 0;
        for (ParcoursNiveau n : service.niveaux()) {
            n.blocs().forEach(b -> b.etapes().forEach(e -> map.put(e.quiz(), new Progress(0, 1))));
        }
        for (String quiz : map.keySet()) {
            if (i++ < doneFirst) {
                map.put(quiz, new Progress(1, 1));
            }
        }
        return map;
    }

    @Test
    void newLearner_startsAtFirstStepOfA1() {
        when(scores.progressByTitle(eq("alice"), any())).thenReturn(progres(0));
        Suivi s = service.suivi("alice");
        assertFalse(s.termine());
        assertFalse(s.commence());
        assertEquals("A1", s.niveau());
        assertEquals(1, s.numero());
    }

    @Test
    void learner_continuesAfterCompletedSteps() {
        when(scores.progressByTitle(eq("alice"), any())).thenReturn(progres(3));
        Suivi s = service.suivi("alice");
        assertTrue(s.commence());
        assertEquals(3, s.faites());
        assertEquals(4, s.numero());
    }

    @Test
    void everythingDone_isFinished() {
        when(scores.progressByTitle(eq("alice"), any())).thenReturn(progres(10_000));
        Suivi s = service.suivi("alice");
        assertTrue(s.termine());
        assertEquals(s.total(), s.faites());
    }

    @Test
    void stepWithoutQuiz_isSkipped() {
        Map<String, Progress> map = progres(0);
        String first = map.keySet().iterator().next();
        map.put(first, new Progress(0, 0));
        when(scores.progressByTitle(eq("alice"), any())).thenReturn(map);
        assertEquals(2, service.suivi("alice").numero());
    }

    @Test
    void noQuizAtAll_stillStartsAtFirstStep() {
        Map<String, Progress> map = progres(0);
        map.replaceAll((quiz, p) -> new Progress(0, 0));
        when(scores.progressByTitle(eq("alice"), any())).thenReturn(map);
        Suivi s = service.suivi("alice");
        assertFalse(s.termine());
        assertEquals(1, s.numero());
    }

    @Test
    void placementLevel_startsAtThatLevel() {
        when(scores.progressByTitle(eq("alice"), any())).thenReturn(progres(0));
        Suivi s = service.suivi("alice", "B1");
        assertEquals("B1", s.niveau());
        assertEquals("B1", s.niveauTest());
        assertEquals(service.niveaux().get(2).blocs().get(0).debut(), s.numero());
    }

    @Test
    void placementLevel_fallsBackToEarlierLevelsWhenLaterOnesAreDone() {
        Map<String, Progress> map = progres(0);
        boolean after = false;
        for (ParcoursNiveau n : service.niveaux()) {
            after = after || n.code().equals("B1");
            if (after) {
                n.blocs().forEach(b -> b.etapes().forEach(e -> map.put(e.quiz(), new Progress(1, 1))));
            }
        }
        when(scores.progressByTitle(eq("alice"), any())).thenReturn(map);
        assertEquals("A1", service.suivi("alice", "B1").niveau());
    }

    @Test
    void unknownPlacementLevel_isIgnored() {
        when(scores.progressByTitle(eq("alice"), any())).thenReturn(progres(0));
        Suivi s = service.suivi("alice", "Z9");
        assertEquals("A1", s.niveau());
        assertEquals(null, s.niveauTest());
    }

    @Test
    void parcoursHas83Steps() {
        int steps = service.niveaux().stream().mapToInt(n -> n.blocs().stream().mapToInt(b -> b.etapes().size()).sum()).sum();
        assertEquals(83, steps);
        assertEquals(Set.of("A1", "A2", "B1", "B2"),
                Set.copyOf(service.niveaux().stream().map(ParcoursNiveau::code).toList()));
    }
}
