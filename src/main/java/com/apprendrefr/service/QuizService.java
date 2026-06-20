package com.apprendrefr.service;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.repository.QuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuizService {

    private final QuizRepository quizRepository;

    public Quiz findByTitle(String title) {
        return quizRepository.findByTitle(title)
                .orElse(new Quiz());
    }

    public Quiz getFirstQuiz() {
        return quizRepository.findAll().stream()
                .findFirst()
                .orElse(new Quiz());
    }
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

}