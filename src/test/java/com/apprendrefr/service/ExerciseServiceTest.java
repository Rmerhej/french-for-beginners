package com.apprendrefr.service;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.repository.ExerciseRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class ExerciseServiceTest {

    @Mock
    private ExerciseRepository exerciseRepository;

    @InjectMocks
    private ExerciseService exerciseService;

    private Exercise exercise;

    @BeforeEach
    void setUp() {
        exercise = new Exercise();
        exercise.setId(1L);
        exercise.setLessonTitle("Les articles");
        exercise.setQuestion("Quel article utiliser ?");
        exercise.setCorrectAnswer("le");
        exercise.setExerciseType("MATCHING");
        exercise.setOptionA("le");
        exercise.setOptionB("la");
        exercise.setOptionC("les");
        exercise.setOptionD("un");
    }

    @Test
    void findAll_returnsList() {
        when(exerciseRepository.findAll()).thenReturn(List.of(exercise));

        List<Exercise> result = exerciseService.findAll();

        assertEquals(1, result.size());
        assertEquals("Les articles", result.get(0).getLessonTitle());
    }

    @Test
    void findById_found() {
        when(exerciseRepository.findById(1L)).thenReturn(Optional.of(exercise));

        Optional<Exercise> result = exerciseService.findById(1L);

        assertTrue(result.isPresent());
        assertEquals("Quel article utiliser ?", result.get().getQuestion());
    }

    @Test
    void findById_notFound() {
        when(exerciseRepository.findById(99L)).thenReturn(Optional.empty());

        Optional<Exercise> result = exerciseService.findById(99L);

        assertTrue(result.isEmpty());
    }

    @Test
    void save_success() {
        when(exerciseRepository.save(any(Exercise.class))).thenReturn(exercise);

        Exercise saved = exerciseService.save(exercise);

        assertNotNull(saved);
        assertEquals(1L, saved.getId());
        verify(exerciseRepository).save(exercise);
    }

    @Test
    void deleteById_success() {
        doNothing().when(exerciseRepository).deleteById(1L);

        exerciseService.deleteById(1L);

        verify(exerciseRepository).deleteById(1L);
    }

    @Test
    void findByLessonTitle_success() {
        when(exerciseRepository.findByLessonTitle("Les articles"))
                .thenReturn(List.of(exercise));

        List<Exercise> result = exerciseService.findByLessonTitle("Les articles");

        assertEquals(1, result.size());
    }

    @Test
    void findMatchingExercisesByLesson_filtersCorrectly() {
        Exercise matching = new Exercise();
        matching.setExerciseType("MATCHING");
        matching.setLessonTitle("Les articles");

        Exercise qcm = new Exercise();
        qcm.setExerciseType("QCM");
        qcm.setLessonTitle("Les articles");

        when(exerciseRepository.findByLessonTitle("Les articles"))
                .thenReturn(List.of(matching, qcm));

        List<Exercise> result = exerciseService.findMatchingExercisesByLesson("Les articles");

        assertEquals(1, result.size());
        assertEquals("MATCHING", result.get(0).getExerciseType());
    }

    @Test
    void searchExercises_success() {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Exercise> page = new PageImpl<>(List.of(exercise));

        when(exerciseRepository.findByQuestionContainingIgnoreCaseOrLessonTitleContainingIgnoreCase(
                "article", "article", pageable)).thenReturn(page);

        Page<Exercise> result = exerciseService.searchExercises("article", pageable);

        assertEquals(1, result.getTotalElements());
    }

    @Test
    void count_returnsCorrectValue() {
        when(exerciseRepository.count()).thenReturn(5L);

        assertEquals(5L, exerciseService.count());
    }
}
