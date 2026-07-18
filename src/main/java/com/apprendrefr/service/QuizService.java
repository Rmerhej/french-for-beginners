package com.apprendrefr.service;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.repository.QuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class QuizService {

    private final QuizRepository quizRepository;

    @Autowired
    public QuizService(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }

    public List<Quiz> findAll() {
        return quizRepository.findAll();
    }

    public Optional<Quiz> findById(Long id) {
        return quizRepository.findById(id);
    }

    public Quiz save(Quiz quiz) {
        return quizRepository.save(quiz);
    }

    public List<Quiz> findByTitleContainingIgnoreCase(String title) {
        return quizRepository.findByTitleContainingIgnoreCase(title);
    }

    public void deleteById(Long id) {
        quizRepository.deleteById(id);
    }


    public Quiz getFirstQuiz() {
        return quizRepository.findAll().stream().findFirst().orElse(new Quiz());
    }

    public List<Quiz> findByTitleContaining(String title) {
        List<Quiz> results = quizRepository.findByTitleContainingIgnoreCase(title);
        return results != null ? results : new ArrayList<>();
    }

    public Page<Quiz> searchQuizzes(String keyword, Pageable pageable) {

        if (keyword == null || keyword.trim().isEmpty()) {
            return quizRepository.findAll(pageable);
        }

        return quizRepository.findByTitleContainingIgnoreCase(
                keyword.trim(),
                pageable
        );
    }
    public long count() {
        return quizRepository.count();
    }

}