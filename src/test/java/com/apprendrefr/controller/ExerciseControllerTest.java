package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.repository.*;
import com.apprendrefr.service.ExerciseService;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;
import java.util.List;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(ExerciseController.class)
@AutoConfigureMockMvc(addFilters = false)

class ExerciseControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Mock
    private ExerciseService exerciseService;

    @MockitoBean
    private QuizRepository quizRepository;
    @MockitoBean
    private LessonRepository lessonRepository;
    @MockitoBean
    private UserRepository userRepository;
    @MockitoBean
    private PrononciationRepository prononciationRepository;
    @MockitoBean
    private ExerciseRepository exerciseRepository;
    @MockitoBean
    private VocabularyRepository vocabularyRepository;
    @MockitoBean
    private ThemeRepository themeRepository;
    @Test
    void getCulturePage_shouldReturnCultureViewWithExercises() throws Exception {

        Exercise exercise = new Exercise();
        exercise.setId(1L);
        exercise.setLessonTitle("Culture française");
        exercise.setQuestion("Quelle est la capitale de la France ?");

        when(exerciseService.findByLessonTitleContaining("Culture"))
                .thenReturn(List.of(exercise));

        mockMvc.perform(get("/culture"))
                .andExpect(status().isOk())
                .andExpect(view().name("culture"))
                .andExpect(model().attributeExists("exercises"))
                .andExpect(model().attribute("exercises", List.of(exercise)));
    }

    @Test
    void getCulturePage_shouldReturnEmptyListWhenServiceReturnsNull() throws Exception {

        when(exerciseService.findByLessonTitleContaining("Culture"))
                .thenReturn(null);

        mockMvc.perform(get("/culture"))
                .andExpect(status().isOk())
                .andExpect(view().name("culture"))
                .andExpect(model().attributeExists("exercises"))
                .andExpect(model().attribute("exercises", Collections.emptyList()));
    }
}