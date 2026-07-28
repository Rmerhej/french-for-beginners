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
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
class UserRegistrationIntegrationTest {

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
    }

    @Test
    void registerUser_viaService_success() {
        User user = new User();
        user.setUsername("nouveau");
        user.setEmail("nouveau@test.com");
        user.setPassword("Password123");

        userService.registerUser(user);

        User saved = userRepository.findByUsername("nouveau").orElseThrow();

        assertEquals("ROLE_USER", saved.getRole());
        assertTrue(saved.isEnabled());
        assertTrue(passwordEncoder.matches("Password123", saved.getPassword()));
        assertNotEquals("Password123", saved.getPassword()); // bien hashé
    }

    @Test
    void registerUser_duplicateUsername_throwsException() {
        User user1 = new User();
        user1.setUsername("duplique");
        user1.setEmail("un@test.com");
        user1.setPassword("Password123");
        userService.registerUser(user1);

        User user2 = new User();
        user2.setUsername("duplique");
        user2.setEmail("deux@test.com");
        user2.setPassword("Password123");

        RuntimeException ex = assertThrows(RuntimeException.class,
                () -> userService.registerUser(user2));

        assertEquals("Ce nom d'utilisateur est déjà utilisé", ex.getMessage());
    }

    @Test
    void registerUser_viaController_success() throws Exception {
        mockMvc.perform(post("/register")
                        .with(csrf())
                        .param("username", "controlleruser")
                        .param("email", "controller@test.com")
                        .param("password", "Password123")
                        .param("confirmPassword", "Password123"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/login"))
                .andExpect(flash().attributeExists("success"));

        assertTrue(userRepository.existsByUsername("controlleruser"));
    }

    @Test
    void registerUser_passwordMismatch_staysOnForm() throws Exception {
        mockMvc.perform(post("/register")
                        .with(csrf())
                        .param("username", "testuser")
                        .param("email", "test@test.com")
                        .param("password", "Password123")
                        .param("confirmPassword", "Different456"))
                .andExpect(status().isOk())
                .andExpect(view().name("register"));
    }
}
