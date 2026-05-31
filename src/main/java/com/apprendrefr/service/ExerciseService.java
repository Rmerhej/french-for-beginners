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

    // Méthode de recherche pour l'admin
    public Page<Exercise> searchExercises(String keyword, Pageable pageable) {
        return exerciseRepository.findByQuestionContainingIgnoreCaseOrLessonTitleContainingIgnoreCase(
                keyword, keyword, pageable);
    }

    public Exercise save(Exercise exercise) {
        return exerciseRepository.save(exercise);
    }

    public void deleteById(Long id) {
        exerciseRepository.deleteById(id);
    }
}