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

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;


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
        exercise.setLessonTitle("Culture française");
        exercise.setQuestion("Quelle est la capitale de la France ?");
        exercise.setExerciseType("QUIZ");
        exercise.setCorrectAnswer("Paris");

    }


    @Test
    void findAll_shouldReturnExercises() {

        when(exerciseRepository.findAll())
                .thenReturn(List.of(exercise));


        List<Exercise> result =
                exerciseService.findAll();

        assertThat(result)
                .hasSize(1);


        assertThat(result.get(0).getLessonTitle())
                .isEqualTo("Culture française");


        verify(exerciseRepository)
                .findAll();
    }


    @Test
    void findAllPaginated_shouldReturnPage() {


        Page<Exercise> page =
                new PageImpl<>(List.of(exercise));


        when(exerciseRepository.findAll(any(Pageable.class)))
                .thenReturn(page);


        Page<Exercise> result =
                exerciseService.findAllPaginated(
                        PageRequest.of(0, 10)
                );


        assertThat(result.getContent())
                .hasSize(1);


        verify(exerciseRepository)
                .findAll(any(Pageable.class));
    }


    @Test
    void findById_shouldReturnExercise() {


        when(exerciseRepository.findById(1L))
                .thenReturn(Optional.of(exercise));


        Optional<Exercise> result =
                exerciseService.findById(1L);


        assertThat(result)
                .isPresent();


        assertThat(result.get().getId())
                .isEqualTo(1L);

        verify(exerciseRepository)
                .findById(1L);
    }


    @Test
    void findByLessonTitle_shouldReturnExercises() {


        when(exerciseRepository.findByLessonTitle("Culture française"))
                .thenReturn(List.of(exercise));


        List<Exercise> result =
                exerciseService.findByLessonTitle(
                        "Culture française"
                );


        assertThat(result)
                .hasSize(1);


        verify(exerciseRepository)
                .findByLessonTitle("Culture française");
    }


    @Test
    void findByLessonTitleContaining_shouldReturnExercises() {


        when(exerciseRepository
                .findByLessonTitleContainingIgnoreCase("culture"))
                .thenReturn(List.of(exercise));


        List<Exercise> result =
                exerciseService.findByLessonTitleContaining(
                        "culture"
                );


        assertThat(result)
                .hasSize(1);
    }


    @Test
    void count_shouldReturnNumberOfExercises() {


        when(exerciseRepository.count())
                .thenReturn(5L);


        long result =
                exerciseService.count();


        assertThat(result)
                .isEqualTo(5L);
    }


    @Test
    void save_shouldSaveExercise() {


        when(exerciseRepository.save(exercise))
                .thenReturn(exercise);


        Exercise result =
                exerciseService.save(exercise);


        assertThat(result)
                .isNotNull();


        assertThat(result.getQuestion())
                .isEqualTo(
                        "Quelle est la capitale de la France ?"
                );


        verify(exerciseRepository)
                .save(exercise);
    }


    @Test
    void deleteById_shouldDeleteExercise() {
        Long id = 1L;

        exerciseService.deleteById(id);

    }


    @Test
    void findMatchingExercisesByLesson_shouldReturnOnlyMatchingExercises() {


        Exercise matching = new Exercise();

        matching.setExerciseType("MATCHING");
        matching.setLessonTitle("Culture française");


        Exercise quiz = new Exercise();

        quiz.setExerciseType("QUIZ");
        quiz.setLessonTitle("Culture française");


        when(exerciseRepository.findByLessonTitle("Culture française"))
                .thenReturn(
                        List.of(matching, quiz)
                );


        List<Exercise> result =
                exerciseService.findMatchingExercisesByLesson(
                        "Culture française"
                );


        assertThat(result)
                .hasSize(1);


        assertThat(result.get(0).getExerciseType())
                .isEqualTo("MATCHING");
    }


    @Test
    void searchExercises_shouldReturnPage() {


        Page<Exercise> page =
                new PageImpl<>(List.of(exercise));


        when(
                exerciseRepository
                        .findByQuestionContainingIgnoreCaseOrLessonTitleContainingIgnoreCase(
                                eq("Paris"),
                                eq("Paris"),
                                any()
                        )
        )
                .thenReturn(page);


        Page<Exercise> result =
                exerciseService.searchExercises(
                        "Paris",
                        PageRequest.of(0, 10)
                );


        assertThat(result.getContent())
                .hasSize(1);
    }


    @Test
    void findByTitle_shouldReturnExercises() {


        when(exerciseRepository.findByLessonTitle("Culture"))
                .thenReturn(List.of(exercise));


        List<Exercise> result =
                exerciseService.findByTitle("Culture");


        assertThat(result)
                .hasSize(1);
    }

}
