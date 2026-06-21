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

    public void deleteById(Long id) {
        quizRepository.deleteById(id);
    }
    public Page<Quiz> searchQuiz(String keyword, Pageable pageable) {
        // On cherche le mot-clé dans le titre OU dans la phrase (sentence)
        return quizRepository.findByTitleContainingIgnoreCaseOrSentenceContainingIgnoreCase(
                keyword, keyword, pageable);
    }
    public Quiz getFirstQuiz() {
        return quizRepository.findAll().stream().findFirst().orElse(new Quiz());
    }
    public List<Quiz> findByTitleContaining(String title) {
        List<Quiz> results = quizRepository.findByTitleContainingIgnoreCase(title);
        return results != null ? results : new ArrayList<>();
    }

}