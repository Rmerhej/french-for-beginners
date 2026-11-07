package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Page « Aide » : publique, en français simple, avec les durées réelles de connexion et un contact. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class HelpPageTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void pageIsPublic_explainsTheSession_andGivesAContact() throws Exception {
        mockMvc.perform(get("/aide"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("<h1>Aide : connexion et mémoire de votre appareil</h1>")))
                .andExpect(content().string(containsString("30 minutes")))
                .andExpect(content().string(containsString("14 jours")))
                .andExpect(content().string(containsString("En cas de problème")))
                .andExpect(content().string(containsString("mailto:rolandmerhej8@gmail.com")));
    }

    @Test
    void sessionDurationsInThePageMatchTheConfiguration() throws Exception {
        String yml = java.nio.file.Files.readString(java.nio.file.Path.of("src/main/resources/application.yml"));
        org.assertj.core.api.Assertions.assertThat(yml).contains("timeout: 30m");
        String security = java.nio.file.Files.readString(
                java.nio.file.Path.of("src/main/java/com/apprendrefr/config/SecurityConfig.java"));
        org.assertj.core.api.Assertions.assertThat(security).contains(".tokenValiditySeconds(1209600)");
    }

    @Test
    void footerSitePlanAndSitemapLinkToIt() throws Exception {
        mockMvc.perform(get("/contact"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("href=\"/aide\"")));
        mockMvc.perform(get("/plan-du-site"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("href=\"/aide\"")));
        mockMvc.perform(get("/sitemap.xml"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("/aide")));
    }
}
