package com.apprendrefr.service;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.repository.QuizRepository;
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
class QuizServiceTest {

    @Mock
    private QuizRepository quizRepository;

    @InjectMocks
    private QuizService quizService;

    private Quiz quiz;

    @BeforeEach
    void setUp() {
        quiz = new Quiz();
        quiz.setId(1L);
        quiz.setTitle("Quiz grammaire - Articles");
        quiz.setSentence("Je mange ___ pomme.");
        quiz.setCorrectAnswers("une");
        quiz.setQuizType("GRAMMAIRE");
    }

    @Test
    void findAll_returnsList() {
        when(quizRepository.findAll()).thenReturn(List.of(quiz));

        List<Quiz> result = quizService.findAll();

        assertEquals(1, result.size());
        assertEquals("Quiz grammaire - Articles", result.get(0).getTitle());
    }

    @Test
    void findById_found() {
        when(quizRepository.findById(1L)).thenReturn(Optional.of(quiz));

        Optional<Quiz> result = quizService.findById(1L);

        assertTrue(result.isPresent());
    }

    @Test
    void save_success() {
        when(quizRepository.save(any(Quiz.class))).thenReturn(quiz);

        Quiz saved = quizService.save(quiz);

        assertNotNull(saved);
        verify(quizRepository).save(quiz);
    }

    @Test
    void deleteById_success() {
        doNothing().when(quizRepository).deleteById(1L);

        quizService.deleteById(1L);

        verify(quizRepository).deleteById(1L);
    }

    @Test
    void findByTitleContainingIgnoreCase_success() {
        when(quizRepository.findByTitleContainingIgnoreCase("grammaire"))
                .thenReturn(List.of(quiz));

        List<Quiz> result = quizService.findByTitleContainingIgnoreCase("grammaire");

        assertEquals(1, result.size());
    }

    @Test
    void searchQuizzes_withKeyword() {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Quiz> page = new PageImpl<>(List.of(quiz));

        when(quizRepository.findByTitleContainingIgnoreCase("articles", pageable))
                .thenReturn(page);

        Page<Quiz> result = quizService.searchQuizzes("articles", pageable);

        assertEquals(1, result.getTotalElements());
    }

    @Test
    void searchQuizzes_emptyKeyword_returnsAll() {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Quiz> page = new PageImpl<>(List.of(quiz));

        when(quizRepository.findAll(pageable)).thenReturn(page);

        Page<Quiz> result = quizService.searchQuizzes("  ", pageable);

        assertEquals(1, result.getTotalElements());
        verify(quizRepository).findAll(pageable);
    }

    @Test
    void getFirstQuiz_whenExists() {
        when(quizRepository.findAll()).thenReturn(List.of(quiz));

        Quiz result = quizService.getFirstQuiz();

        assertEquals("Quiz grammaire - Articles", result.getTitle());
    }

    @Test
    void getFirstQuiz_whenEmpty_returnsNewQuiz() {
        when(quizRepository.findAll()).thenReturn(List.of());

        Quiz result = quizService.getFirstQuiz();

        assertNotNull(result);
        assertNull(result.getId());
    }

    @Test
    void count_returnsCorrectValue() {
        when(quizRepository.count()).thenReturn(8L);

        assertEquals(8L, quizService.count());
    }
}
