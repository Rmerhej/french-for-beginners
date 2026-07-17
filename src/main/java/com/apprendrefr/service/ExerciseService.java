package com.apprendrefr.service;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.repository.ExerciseRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ExerciseService {

    private final ExerciseRepository exerciseRepository;

    public ExerciseService(ExerciseRepository exerciseRepository) {
        this.exerciseRepository = exerciseRepository;
    }

    public List<Exercise> findAll() {
        return exerciseRepository.findAll();
    }

    public Page<Exercise> findAllPaginated(Pageable pageable) {
        return exerciseRepository.findAll(pageable);
    }

    public Optional<Exercise> findById(Long id) {
        return exerciseRepository.findById(id);
    }

    public List<Exercise> findByLessonTitle(String lessonTitle) {
        return exerciseRepository.findByLessonTitle(lessonTitle);
    }

    public long count() {
        return exerciseRepository.count();
    }

    public Exercise save(Exercise exercise) {
        return exerciseRepository.save(exercise);
    }


    public List<Exercise> findByLessonTitleContaining(String keyword) {
        return exerciseRepository.findByLessonTitleContainingIgnoreCase(keyword);
    }

    public void deleteById(Long id) {
        exerciseRepository.deleteById(id);
    }


    public List<Exercise> findMatchingExercisesByLesson(String lessonTitle) {
        return exerciseRepository.findByLessonTitle(lessonTitle).stream()
                .filter(e -> "MATCHING".equals(e.getExerciseType()))
                .toList();
    }

    public Page<Exercise> searchExercises(String keyword, Pageable pageable) {
        return exerciseRepository.findByQuestionContainingIgnoreCaseOrLessonTitleContainingIgnoreCase(
                keyword, keyword, pageable);
    }

    public List<Exercise> findByTitle(String title) {
        return exerciseRepository.findByLessonTitle(title);
    }
}