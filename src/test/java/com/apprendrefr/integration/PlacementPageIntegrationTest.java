package com.apprendrefr.integration;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.repository.ExerciseRepository;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Page /testEval : chaque question porte son niveau (pour le calcul bloc par bloc) et le script de calcul est chargé. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class PlacementPageIntegrationTest {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private ExerciseRepository exerciseRepository;

    private Long id;

    @BeforeEach
    void setUp() {
        Exercise e = new Exercise();
        e.setLessonTitle("Test niveau page");
        e.setQuestion("Je ___ étudiant.");
        e.setOptionA("est");
        e.setOptionB("suis");
        e.setOptionC("sont");
        e.setOptionD("êtes");
        e.setCorrectAnswer("B");
        e.setLessonLevel("B1");
        id = exerciseRepository.save(e).getId();
    }

    @AfterEach
    void cleanUp() {
        exerciseRepository.deleteById(id);
    }

    @Test
    void questionsCarryTheirLevel_andTheScoringScriptIsLoaded() throws Exception {
        mockMvc.perform(get("/testEval"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("data-level=\"B1\"")))
                .andExpect(content().string(containsString("/js/placement-level.js")))
                .andExpect(content().string(containsString("id=\"cecr-details\"")));
        mockMvc.perform(get("/js/placement-level.js"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("FFBPlacement")));
    }
}
