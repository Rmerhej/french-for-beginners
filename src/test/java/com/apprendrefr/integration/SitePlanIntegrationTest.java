package com.apprendrefr.integration;

import com.apprendrefr.controller.SeoController;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.nio.charset.StandardCharsets;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class SitePlanIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void sitePlanIsPublicAndListsTheMainSections() throws Exception {
        mockMvc.perform(get("/plan-du-site"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Plan du site")))
                .andExpect(content().string(containsString("/supports-de-cours")))
                .andExpect(content().string(containsString("/conjugueur")))
                .andExpect(content().string(containsString("/rgpd")));
    }

    @Test
    void sitePlanHasNoLongLessonListByLevel() throws Exception {
        mockMvc.perform(get("/plan-du-site"))
                .andExpect(status().isOk())
                .andExpect(content().string(not(containsString("Les leçons par niveau"))))
                .andExpect(content().string(not(containsString("id=\"plan-lecons\""))))
                .andExpect(content().string(containsString("Leçons de vocabulaire")));
    }

    @Test
    void verbsAndLettersAreUnderLearnNotPractice() throws Exception {
        String html = mockMvc.perform(get("/plan-du-site"))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();
        int learn = html.indexOf("id=\"plan-apprendre\"");
        int practice = html.indexOf("id=\"plan-pratiquer\"");
        int discover = html.indexOf("id=\"plan-decouvrir\"");
        org.junit.jupiter.api.Assertions.assertTrue(learn < html.indexOf("/lesVerbes") && html.indexOf("/lesVerbes") < practice);
        org.junit.jupiter.api.Assertions.assertTrue(learn < html.indexOf("/chiffresEtLettres") && html.indexOf("/chiffresEtLettres") < practice);
        String practiceBlock = html.substring(practice, discover);
        org.junit.jupiter.api.Assertions.assertFalse(practiceBlock.contains("/lesVerbes"));
        org.junit.jupiter.api.Assertions.assertFalse(practiceBlock.contains("/chiffresEtLettres"));
        org.junit.jupiter.api.Assertions.assertTrue(practiceBlock.contains("Grammaire et conjugaison (quiz)"));
        org.junit.jupiter.api.Assertions.assertTrue(practiceBlock.contains("Leçons de vocabulaire (QCM)"));
    }

    @Test
    void visitorSeesLoginAndRegisterButNotMyResults() throws Exception {
        mockMvc.perform(get("/plan-du-site"))
                .andExpect(content().string(containsString("id=\"plan-register\"")))
                .andExpect(content().string(not(containsString("id=\"plan-results\""))));
    }

    @Test
    void connectedLearnerSeesMyResultsInsteadOfLogin() throws Exception {
        mockMvc.perform(get("/plan-du-site").with(user("apprenant").roles("USER")))
                .andExpect(content().string(containsString("id=\"plan-results\"")))
                .andExpect(content().string(not(containsString("id=\"plan-register\""))));
    }

    @Test
    void footerLinksToTheSitePlan() throws Exception {
        try (var in = new ClassPathResource("templates/fragments/footer.html").getInputStream()) {
            String footer = new String(in.readAllBytes(), StandardCharsets.UTF_8);
            assertTrue(footer.contains("@{/plan-du-site}"));
        }
    }

    @Test
    void sitePlanIsInTheSitemapXml() throws Exception {
        assertTrue(SeoController.publicPages().contains("/plan-du-site"));
        mockMvc.perform(get("/sitemap.xml"))
                .andExpect(content().string(containsString("/plan-du-site</loc>")));
    }
}
