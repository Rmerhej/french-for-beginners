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

/** Page « Accessibilité » : publique, honnête (pas d'audit), avec un moyen de contact, liée depuis le pied de page. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class AccessibilityPageTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void pageIsPublic_saysNoAuditYet_andGivesAContact() throws Exception {
        mockMvc.perform(get("/accessibilite"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("<h1>Accessibilité</h1>")))
                .andExpect(content().string(containsString("pas fait l'objet d'un audit")))
                .andExpect(content().string(containsString("mailto:")))
                .andExpect(content().string(not(containsString("entièrement conforme"))));
    }

    @Test
    void footerAndSitePlanLinkToIt() throws Exception {
        mockMvc.perform(get("/contact"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("href=\"/accessibilite\"")));
        mockMvc.perform(get("/plan-du-site"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("href=\"/accessibilite\"")));
    }

    @Test
    void pageIsInTheSitemap() throws Exception {
        mockMvc.perform(get("/sitemap.xml"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("/accessibilite")));
    }
}
