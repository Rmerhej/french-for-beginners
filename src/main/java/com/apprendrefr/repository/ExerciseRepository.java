package com.apprendrefr.repository;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface ExerciseRepository extends  JpaRepository<Exercise, Long>  {
    List<Exercise> findByLessonTitle(String lessonTitle);
    Page<Exercise> findAll(Pageable pageable);
    Page<Exercise> findByQuestionContainingIgnoreCaseOrLessonTitleContainingIgnoreCase(
            String question, String lessonTitle, Pageable pageable);
}