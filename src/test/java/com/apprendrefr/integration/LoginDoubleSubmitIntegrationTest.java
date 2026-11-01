package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.nio.charset.StandardCharsets;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Le « double clic » sur Se connecter ne doit plus finir sur la page d'erreur blanche (403). */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class LoginDoubleSubmitIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    private static String read(String path) throws Exception {
        try (var in = new ClassPathResource(path).getInputStream()) {
            return new String(in.readAllBytes(), StandardCharsets.UTF_8);
        }
    }

    @Test
    void secondLoginWithOldTokenSendsAnAlreadyConnectedPersonHome() throws Exception {
        mockMvc.perform(post("/login").with(user("apprenant")).param("username", "a").param("password", "b"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/"));
    }

    @Test
    void loginWithAnExpiredTokenWhenNotConnectedGoesBackToTheForm() throws Exception {
        mockMvc.perform(post("/login").param("username", "a").param("password", "b"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/login?expired=true"));
    }

    @Test
    void otherForbiddenPostsStayForbidden() throws Exception {
        mockMvc.perform(post("/register").param("username", "a"))
                .andExpect(status().isForbidden());
    }

    @Test
    void friendly403PageExists() throws Exception {
        String page = read("templates/error/403.html");
        assertTrue(page.contains("403"));
        assertTrue(page.contains("Retour à l'accueil"));
    }

    @Test
    void loginAndRegisterFormsBlockDoubleSubmit() throws Exception {
        for (String template : new String[] {"templates/login.html", "templates/register.html"}) {
            String html = read(template);
            assertTrue(html.contains("data-single-submit"), template);
            assertTrue(html.contains("/js/single-submit.js"), template);
        }
        String js = read("static/js/single-submit.js");
        assertTrue(js.contains("form[data-single-submit]"));
        assertTrue(js.contains("disabled = true"));
    }

    @Test
    void loginPageExplainsAnExpiredForm() throws Exception {
        assertTrue(read("templates/login.html").contains("param.expired"));
    }
}
