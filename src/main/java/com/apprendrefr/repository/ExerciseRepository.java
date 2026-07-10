package com.apprendrefr.repository;

import com.apprendrefr.entity.Exercise;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExerciseRepository extends JpaRepository<Exercise, Long> {
    List<Exercise> findByLessonTitle(String lessonTitle);

    List<Exercise> findByExerciseType(String exerciseType);

    Page<Exercise> findAll(Pageable pageable);

    Page<Exercise> findByQuestionContainingIgnoreCaseOrLessonTitleContainingIgnoreCase(
            String question, String lessonTitle, Pageable pageable);

    //  insensible à la casse
    List<Exercise> findByLessonTitleContainingIgnoreCase(String lessonTitle);
}