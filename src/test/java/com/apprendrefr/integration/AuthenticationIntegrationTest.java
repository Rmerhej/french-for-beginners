package com.apprendrefr.integration;

import com.apprendrefr.entity.User;
import com.apprendrefr.repository.UserRepository;
import com.apprendrefr.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.unauthenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
class AuthenticationIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @BeforeEach
    void setUp() {
        userRepository.deleteAll();

        User user = new User();
        user.setUsername("eleve");
        user.setEmail("eleve@test.com");
        user.setPassword("Password123");
        userService.registerUser(user);
    }

    @Test
    void login_withValidCredentials_shouldSucceed() throws Exception {
        mockMvc.perform(formLogin("/login")
                        .user("eleve")
                        .password("Password123"))
                .andExpect(authenticated().withUsername("eleve"))
                .andExpect(redirectedUrl("/")); // ou la page de succès de ton SuccessHandler
    }

    @Test
    void login_withWrongPassword_shouldFail() throws Exception {
        mockMvc.perform(formLogin("/login")
                        .user("eleve")
                        .password("WrongPassword"))
                .andExpect(unauthenticated())
                .andExpect(redirectedUrl("/login?error=true"));
    }

    @Test
    void login_withUnknownUser_shouldFail() throws Exception {
        mockMvc.perform(formLogin("/login")
                        .user("inconnu")
                        .password("Password123"))
                .andExpect(unauthenticated());
    }

    @Test
    void protectedPage_withoutAuth_redirectsToLogin() throws Exception {
        mockMvc.perform(get("/lessons"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrlPattern("**/login"));
    }

    @Test
    void adminPage_asUser_isForbidden() throws Exception {
        mockMvc.perform(formLogin("/login")
                .user("eleve")
                .password("Password123"));

        // On force le rôle USER (déjà le cas)
        mockMvc.perform(get("/admin/dashboard")
                        .with(org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user("eleve").roles("USER")))
                .andExpect(status().isForbidden());
    }
}
