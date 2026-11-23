package com.apprendrefr.integration;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.User;
import com.apprendrefr.entity.UserExerciseScore;
import com.apprendrefr.repository.ExerciseRepository;
import com.apprendrefr.repository.UserExerciseScoreRepository;
import com.apprendrefr.repository.UserRepository;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrlPattern;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** « Mon compte » : changement du mot de passe et suppression de son propre compte. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class AccountIntegrationTest {

    private static final String USERNAME = "compte_tester";
    private static final String PASSWORD = "Passw0rdTest1";

    @Autowired private MockMvc mockMvc;
    @Autowired private UserRepository userRepository;
    @Autowired private UserExerciseScoreRepository scoreRepository;
    @Autowired private ExerciseRepository exerciseRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    private Exercise exercise;

    @BeforeEach
    void setUp() {
        createUser("ROLE_USER");
        Exercise e = new Exercise();
        e.setLessonTitle("Leçon compte (test)");
        e.setQuestion("Je ___ étudiant.");
        e.setOptionA("est");
        e.setOptionB("suis");
        e.setOptionC("sont");
        e.setOptionD("êtes");
        e.setCorrectAnswer("B");
        exercise = exerciseRepository.save(e);
    }

    @AfterEach
    void cleanUp() {
        userRepository.findByUsername(USERNAME).ifPresent(u -> {
            scoreRepository.deleteByUserId(u.getId());
            userRepository.delete(u);
        });
        exerciseRepository.deleteById(exercise.getId());
    }

    private User createUser(String role) {
        User u = new User();
        u.setUsername(USERNAME);
        u.setEmail("compte_tester@example.invalid");
        u.setPassword(passwordEncoder.encode(PASSWORD));
        u.setRole(role);
        u.setEnabled(true);
        return userRepository.save(u);
    }

    private User reload() {
        return userRepository.findByUsername(USERNAME).orElseThrow();
    }

    @Test
    void anonymousVisitorIsSentToLogin() throws Exception {
        mockMvc.perform(get("/compte"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrlPattern("**/login"));
    }

    @Test
    @WithMockUser(username = USERNAME)
    void pageShowsTheAccountButNeverThePasswordHash() throws Exception {
        mockMvc.perform(get("/compte"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString(USERNAME)))
                .andExpect(content().string(containsString("Supprimer définitivement mon compte")))
                .andExpect(content().string(not(containsString(reload().getPassword()))));
    }

    @Test
    @WithMockUser(username = USERNAME)
    void passwordIsChangedWhenTheCurrentOneIsRight() throws Exception {
        mockMvc.perform(post("/compte/mot-de-passe").with(csrf())
                        .param("actuel", PASSWORD).param("nouveau", "NouveauMdp42").param("confirmation", "NouveauMdp42"))
                .andExpect(status().is3xxRedirection())
                .andExpect(flash().attributeExists("succes"));
        String hash = reload().getPassword();
        assertThat(passwordEncoder.matches("NouveauMdp42", hash)).isTrue();
        assertThat(passwordEncoder.matches(PASSWORD, hash)).isFalse();
    }

    @Test
    @WithMockUser(username = USERNAME)
    void passwordIsKeptWhenTheCurrentOneIsWrong() throws Exception {
        String before = reload().getPassword();
        mockMvc.perform(post("/compte/mot-de-passe").with(csrf())
                        .param("actuel", "pas-le-bon1").param("nouveau", "NouveauMdp42").param("confirmation", "NouveauMdp42"))
                .andExpect(flash().attributeExists("erreur"));
        assertThat(reload().getPassword()).isEqualTo(before);
    }

    @Test
    @WithMockUser(username = USERNAME)
    void weakOrMismatchedNewPasswordsAreRefused() throws Exception {
        String before = reload().getPassword();
        mockMvc.perform(post("/compte/mot-de-passe").with(csrf())
                        .param("actuel", PASSWORD).param("nouveau", "abcdefgh").param("confirmation", "abcdefgh"))
                .andExpect(flash().attributeExists("erreur"));
        mockMvc.perform(post("/compte/mot-de-passe").with(csrf())
                        .param("actuel", PASSWORD).param("nouveau", "NouveauMdp42").param("confirmation", "AutreMdp4242"))
                .andExpect(flash().attributeExists("erreur"));
        assertThat(reload().getPassword()).isEqualTo(before);
    }

    @Test
    @WithMockUser(username = USERNAME)
    void accountAndResultsAreDeletedWhenPasswordAndBoxAreGiven() throws Exception {
        scoreRepository.save(new UserExerciseScore(reload(), exercise, 1));
        mockMvc.perform(post("/compte/supprimer").with(csrf())
                        .param("motDePasse", PASSWORD).param("confirmation", "oui"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/login?supprime"));
        assertThat(userRepository.findByUsername(USERNAME)).isEmpty();
        assertThat(scoreRepository.findAll()).noneMatch(s -> s.getExercise().getId().equals(exercise.getId()));
    }

    @Test
    @WithMockUser(username = USERNAME)
    void accountIsKeptWithoutTheBoxOrWithAWrongPassword() throws Exception {
        mockMvc.perform(post("/compte/supprimer").with(csrf()).param("motDePasse", PASSWORD))
                .andExpect(flash().attributeExists("erreurSuppression"));
        mockMvc.perform(post("/compte/supprimer").with(csrf())
                        .param("motDePasse", "pas-le-bon1").param("confirmation", "oui"))
                .andExpect(flash().attributeExists("erreurSuppression"));
        assertThat(userRepository.findByUsername(USERNAME)).isPresent();
    }

    @Test
    @WithMockUser(username = USERNAME, roles = "ADMIN")
    void administratorAccountCannotBeDeletedFromThisPage() throws Exception {
        User admin = reload();
        admin.setRole("ROLE_ADMIN");
        userRepository.save(admin);
        mockMvc.perform(post("/compte/supprimer").with(csrf())
                        .param("motDePasse", PASSWORD).param("confirmation", "oui"))
                .andExpect(flash().attributeExists("erreurSuppression"));
        assertThat(userRepository.findByUsername(USERNAME)).isPresent();
    }
}
