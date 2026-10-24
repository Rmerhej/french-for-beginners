package com.apprendrefr.integration;

import com.apprendrefr.entity.User;
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

import static org.hamcrest.Matchers.containsString;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class PlacementIntegrationTest {

    private static final String USERNAME = "placement_tester";

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private UserRepository userRepository;

    @BeforeEach
    void setUp() {
        userRepository.findByUsername(USERNAME).orElseGet(() -> {
            User u = new User();
            u.setUsername(USERNAME);
            u.setEmail("placement_tester@example.invalid");
            u.setPassword("Passw0rdTest1");
            u.setRole("ROLE_USER");
            u.setEnabled(true);
            return userRepository.save(u);
        });
    }

    /** Nettoyage : les autres tests supposent une base sans ce compte. */
    @AfterEach
    void cleanUp() {
        userRepository.findByUsername(USERNAME).ifPresent(userRepository::delete);
    }

    @Test
    @WithMockUser(username = USERNAME)
    void validLevel_isSaved() throws Exception {
        mockMvc.perform(post("/evaluation/niveau").param("niveau", "b1").with(csrf()))
                .andExpect(status().isNoContent());
        assertEquals("B1", userRepository.findByUsername(USERNAME).orElseThrow().getPlacementLevel());
    }

    @Test
    @WithMockUser(username = USERNAME)
    void invalidLevel_isRejected() throws Exception {
        mockMvc.perform(post("/evaluation/niveau").param("niveau", "C2").with(csrf()))
                .andExpect(status().isBadRequest());
        assertNull(userRepository.findByUsername(USERNAME).orElseThrow().getPlacementLevel());
    }

    @Test
    @WithMockUser(username = USERNAME)
    void homeShowsRecommendedLevel() throws Exception {
        mockMvc.perform(post("/evaluation/niveau").param("niveau", "A2").with(csrf()))
                .andExpect(status().isNoContent());
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Niveau conseillé par votre test de positionnement")));
    }
}
