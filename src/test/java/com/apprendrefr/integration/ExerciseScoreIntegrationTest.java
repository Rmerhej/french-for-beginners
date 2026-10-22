package com.apprendrefr.integration;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.User;
import com.apprendrefr.repository.ExerciseRepository;
import com.apprendrefr.repository.UserExerciseScoreRepository;
import com.apprendrefr.repository.UserRepository;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ExerciseScoreIntegrationTest {

    private static final String USERNAME = "score_tester";

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ExerciseRepository exerciseRepository;
    @Autowired
    private UserExerciseScoreRepository scoreRepository;

    private User user;
    private Exercise exercise;

    @BeforeEach
    void setUp() {
        user = userRepository.findByUsername(USERNAME).orElseGet(() -> {
            User u = new User();
            u.setUsername(USERNAME);
            u.setEmail("score_tester@example.invalid");
            u.setPassword("Passw0rdTest1");
            u.setRole("ROLE_USER");
            u.setEnabled(true);
            return userRepository.save(u);
        });
        Exercise e = new Exercise();
        e.setLessonTitle("Leçon de test");
        e.setQuestion("Je ___ étudiant.");
        e.setOptionA("est");
        e.setOptionB("suis");
        e.setOptionC("sont");
        e.setOptionD("êtes");
        e.setCorrectAnswer("B");
        exercise = exerciseRepository.save(e);
    }

    /** Nettoyage : les autres tests supposent une base sans ce compte ni ses scores. */
    @AfterEach
    void cleanUp() {
        scoreRepository.deleteAll();
        exerciseRepository.deleteById(exercise.getId());
        userRepository.findByUsername(USERNAME).ifPresent(userRepository::delete);
    }

    @Test
    @WithMockUser(username = USERNAME)
    void correctAnswer_isSavedWithScoreOne() throws Exception {
        long before = scoreRepository.countByUserId(user.getId());

        mockMvc.perform(post("/exercise/submit/{id}", exercise.getId())
                        .param("userAnswer", "suis").with(csrf()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.correct").value(true))
                .andExpect(jsonPath("$.correctAnswer").value("suis"));

        assertEquals(before + 1, scoreRepository.countByUserId(user.getId()));
    }

    @Test
    @WithMockUser(username = USERNAME)
    void wrongAnswer_isSavedWithScoreZero() throws Exception {
        long wrongBefore = scoreRepository.countByUserIdAndScore(user.getId(), 0);

        mockMvc.perform(post("/exercise/submit/{id}", exercise.getId())
                        .param("userAnswer", "A").with(csrf()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.correct").value(false));

        assertEquals(wrongBefore + 1, scoreRepository.countByUserIdAndScore(user.getId(), 0));
    }

    @Test
    @WithMockUser(username = USERNAME)
    void unknownExercise_returns404() throws Exception {
        mockMvc.perform(post("/exercise/submit/{id}", 999999999L)
                        .param("userAnswer", "A").with(csrf()))
                .andExpect(status().isNotFound());
    }

    @Test
    @WithMockUser(username = USERNAME)
    void myResults_listsAttemptedAndGivesCsrfToken() throws Exception {
        mockMvc.perform(post("/exercise/submit/{id}", exercise.getId())
                .param("userAnswer", "suis").with(csrf())).andExpect(status().isOk());

        mockMvc.perform(get("/exercise/my-results"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.successfulIds").isArray())
                .andExpect(jsonPath("$.attemptedIds").isArray());
    }

    @Test
    void anonymous_isRedirectedToLogin_andNothingSaved() throws Exception {
        long before = scoreRepository.count();

        mockMvc.perform(post("/exercise/submit/{id}", exercise.getId())
                        .param("userAnswer", "suis").with(csrf()))
                .andExpect(status().is3xxRedirection());

        assertEquals(before, scoreRepository.count());
    }
}
