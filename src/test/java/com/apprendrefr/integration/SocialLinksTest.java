package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Les liens Facebook et LinkedIn du pied de page viennent de application.yml (app.social). */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class SocialLinksTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void footer_showsFacebookAndLinkedinFromConfiguration() throws Exception {
        mockMvc.perform(get("/")).andExpect(status().isOk())
                .andExpect(content().string(containsString("https://www.facebook.com/Secours.Catholique.Caritas.france")))
                .andExpect(content().string(containsString("https://www.linkedin.com/company/secours-catholique-france/")))
                .andExpect(content().string(containsString("bi-linkedin")))
                .andExpect(content().string(not(containsString("bi-instagram"))))
                .andExpect(content().string(not(containsString("bi-youtube"))));
    }

    @Test
    void footer_isAlsoCompleteOnPagesDeclaredInStaticPagesConfig() throws Exception {
        mockMvc.perform(get("/politesse")).andExpect(status().isOk())
                .andExpect(content().string(containsString("https://www.facebook.com/Secours.Catholique.Caritas.france")))
                .andExpect(content().string(containsString("https://www.linkedin.com/company/secours-catholique-france/")));
    }
}
