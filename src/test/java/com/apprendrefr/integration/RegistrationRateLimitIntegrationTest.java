package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestPropertySource(properties = "app.security.register.max-per-hour=2")
@Transactional
class RegistrationRateLimitIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    private org.springframework.test.web.servlet.ResultActions register(String name) throws Exception {
        return mockMvc.perform(post("/register")
                .with(csrf())
                .param("username", name)
                .param("email", name + "@test.com")
                .param("password", "Password123")
                .param("confirmPassword", "Password123"));
    }

    @Test
    void invalidFormsDoNotCount_andTheThirdValidRegistrationIsRefused() throws Exception {
        // Des formulaires refusés (nom trop court) ne consomment pas le quota
        for (int i = 0; i < 5; i++) {
            mockMvc.perform(post("/register").with(csrf())
                            .param("username", "ab")
                            .param("email", "x@test.com")
                            .param("password", "Password123")
                            .param("confirmPassword", "Password123"))
                    .andExpect(view().name("register"))
                    .andExpect(model().attributeHasFieldErrorCode("user", "username", "Size"));
        }

        register("limite1").andExpect(status().is3xxRedirection());
        register("limite2").andExpect(status().is3xxRedirection());

        register("limite3")
                .andExpect(status().isOk())
                .andExpect(view().name("register"))
                .andExpect(model().attributeHasFieldErrorCode("user", "username", "error.rate"));
    }
}
