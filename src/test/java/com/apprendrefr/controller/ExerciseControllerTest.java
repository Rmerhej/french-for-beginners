package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.LessonService;
import com.apprendrefr.service.ScoreService;
import com.apprendrefr.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;
import java.util.List;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(ExerciseController.class)
class ExerciseControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private ExerciseService exerciseService;

    @MockitoBean
    private UserService userService;

    @MockitoBean
    private ScoreService scoreService;

    @MockitoBean
    private LessonService lessonService;

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