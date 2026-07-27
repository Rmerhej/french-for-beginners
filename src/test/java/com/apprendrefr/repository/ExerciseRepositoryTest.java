package com.apprendrefr.repository;

import com.apprendrefr.entity.Exercise;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


@DataJpaTest
class ExerciseRepositoryTest {


    @Autowired
    private ExerciseRepository exerciseRepository;


    private Exercise cultureExercise;


    @BeforeEach
    void setUp() {


        exerciseRepository.deleteAll();


        cultureExercise = new Exercise();

        cultureExercise.setLessonTitle("Culture française");
        cultureExercise.setExerciseType("QUIZ");
        cultureExercise.setQuestion("Quelle est la capitale de la France ?");
        cultureExercise.setCorrectAnswer("Paris");
        cultureExercise.setLessonLevel("A1");


        Exercise grammarExercise = new Exercise();

        grammarExercise.setLessonTitle("Grammaire");
        grammarExercise.setExerciseType("TEXT");
        grammarExercise.setQuestion("Complétez la phrase");
        grammarExercise.setCorrectAnswer("suis");
        grammarExercise.setLessonLevel("A2");


        exerciseRepository.save(cultureExercise);
        exerciseRepository.save(grammarExercise);
    }


    @Test
    void findByLessonTitle_shouldReturnExercises() {


        List<Exercise> result =
                exerciseRepository.findByLessonTitle("Culture française");


        assertThat(result)
                .hasSize(1);


        assertThat(result.get(0).getLessonTitle())
                .isEqualTo("Culture française");
    }


    @Test
    void findByExerciseType_shouldReturnExercises() {


        List<Exercise> result =
                exerciseRepository.findByExerciseType("QUIZ");


        assertThat(result)
                .hasSize(1);


        assertThat(result.get(0).getExerciseType())
                .isEqualTo("QUIZ");
    }


    @Test
    void findByLessonTitleContainingIgnoreCase_shouldIgnoreCase() {


        List<Exercise> result =
                exerciseRepository
                        .findByLessonTitleContainingIgnoreCase("culture");


        assertThat(result)
                .hasSize(1);


        assertThat(result.get(0).getLessonTitle())
                .contains("Culture");
    }


    @Test
    void findByQuestionContainingIgnoreCaseOrLessonTitleContainingIgnoreCase_shouldSearch() {


        Page<Exercise> result =
                exerciseRepository
                        .findByQuestionContainingIgnoreCaseOrLessonTitleContainingIgnoreCase(
                                "capitale",
                                "Culture",
                                PageRequest.of(0, 10)
                        );


        assertThat(result.getContent())
                .hasSize(1);


        assertThat(result.getContent().get(0).getQuestion())
                .contains("capitale");
    }


    @Test
    void findAllPageable_shouldReturnPage() {


        Page<Exercise> page =
                exerciseRepository.findAll(
                        PageRequest.of(0, 5)
                );


        assertThat(page)
                .isNotNull();


        assertThat(page.getContent())
                .hasSize(2);
    }


    @Test
    void saveExercise_shouldGenerateId() {


        Exercise exercise = new Exercise();

        exercise.setLessonTitle("Vocabulaire");
        exercise.setQuestion("Quel est le mot ?");


        Exercise saved =
                exerciseRepository.save(exercise);


        assertThat(saved.getId())
                .isNotNull();


        assertThat(saved.getLessonTitle())
                .isEqualTo("Vocabulaire");
    }


    @Test
    void deleteExercise_shouldRemoveEntity() {


        Long id = cultureExercise.getId();


        exerciseRepository.deleteById(id);


        assertThat(
                exerciseRepository.findById(id)
        )
                .isEmpty();
    }

}