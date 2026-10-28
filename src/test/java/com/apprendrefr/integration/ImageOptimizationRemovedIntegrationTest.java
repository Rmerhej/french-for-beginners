package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * Les images sont allégées à l'envoi (ImageCompressor) et par scripts/compress-images.sh :
 * l'ancien bouton du tableau de bord (un simple lien qui modifiait des fichiers) a été retiré.
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ImageOptimizationRemovedIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void dashboardNoLongerOffersTheOldOptimizationButton() throws Exception {
        mockMvc.perform(get("/admin/dashboard").with(user("admin").roles("ADMIN")))
                .andExpect(status().isOk())
                .andExpect(content().string(not(containsString("/admin/images/optimize"))));
    }

    @Test
    void oldOptimizationAddressIsGone() throws Exception {
        mockMvc.perform(get("/admin/images/optimize").with(user("admin").roles("ADMIN")))
                .andExpect(status().isNotFound());
    }
}
