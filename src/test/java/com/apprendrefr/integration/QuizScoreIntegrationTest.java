package com.apprendrefr.integration;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.entity.User;
import com.apprendrefr.repository.QuizRepository;
import com.apprendrefr.repository.UserQuizScoreRepository;
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
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class QuizScoreIntegrationTest {

    private static final String USERNAME = "quiz_score_tester";

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private QuizRepository quizRepository;
    @Autowired
    private UserQuizScoreRepository scoreRepository;

    private User user;
    private Quiz quiz;

    @BeforeEach
    void setUp() {
        user = userRepository.findByUsername(USERNAME).orElseGet(() -> {
            User u = new User();
            u.setUsername(USERNAME);
            u.setEmail("quiz_score_tester@example.invalid");
            u.setPassword("Passw0rdTest1");
            u.setRole("ROLE_USER");
            u.setEnabled(true);
            return userRepository.save(u);
        });
        Quiz q = new Quiz();
        q.setTitle("Quiz de test progression");
        q.setSentence("Je ____ et tu ____.");
        q.setWords("suis,es");
        q.setCorrectAnswers("suis,es");
        quiz = quizRepository.save(q);
    }

    @AfterEach
    void cleanUp() {
        scoreRepository.deleteAll();
        quizRepository.deleteById(quiz.getId());
        userRepository.findByUsername(USERNAME).ifPresent(userRepository::delete);
    }

    @Test
    @WithMockUser(username = USERNAME)
    void perfectAttempt_isSaved_andQuizBecomesDone() throws Exception {
        mockMvc.perform(post("/quiz/submit/{id}", quiz.getId()).param("answers", "suis|es").with(csrf()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.score").value(2))
                .andExpect(jsonPath("$.total").value(2));

        assertEquals(1, scoreRepository.countByUserId(user.getId()));
        assertTrue(scoreRepository.findPerfectQuizIds(user.getId()).contains(quiz.getId()));
    }

    @Test
    @WithMockUser(username = USERNAME)
    void partialAttempt_isNotPerfect() throws Exception {
        mockMvc.perform(post("/quiz/submit/{id}", quiz.getId()).param("answers", "suis|").with(csrf()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.score").value(1));

        assertTrue(scoreRepository.findPerfectQuizIds(user.getId()).isEmpty());
        assertTrue(scoreRepository.findAttemptedQuizIds(user.getId()).contains(quiz.getId()));
    }

    @Test
    @WithMockUser(username = USERNAME)
    void unknownQuiz_returns404() throws Exception {
        mockMvc.perform(post("/quiz/submit/{id}", 999999999L).param("answers", "a").with(csrf()))
                .andExpect(status().isNotFound());
    }

    @Test
    void anonymous_isRedirected_andNothingSaved() throws Exception {
        long before = scoreRepository.count();
        mockMvc.perform(post("/quiz/submit/{id}", quiz.getId()).param("answers", "suis|es").with(csrf()))
                .andExpect(status().is3xxRedirection());
        assertEquals(before, scoreRepository.count());
    }

    @Test
    @WithMockUser(username = USERNAME)
    void myResultsPage_showsQuizSection() throws Exception {
        mockMvc.perform(post("/quiz/submit/{id}", quiz.getId()).param("answers", "suis|es").with(csrf()))
                .andExpect(status().isOk());

        mockMvc.perform(get("/mes-resultats"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Quiz glisser-déposer")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Quiz de test progression")));
    }

    @Test
    void coursePage_worksForAnonymous() throws Exception {
        mockMvc.perform(get("/supports-de-cours"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Connectez-vous")));
    }

    @Test
    @WithMockUser(username = USERNAME)
    void coursePage_worksForLoggedInUser() throws Exception {
        mockMvc.perform(get("/supports-de-cours"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Votre progression")));
    }
}
