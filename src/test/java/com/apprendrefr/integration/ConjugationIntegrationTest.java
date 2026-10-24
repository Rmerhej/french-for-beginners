package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ConjugationIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    @WithMockUser
    void emptyPage_rendersForm() throws Exception {
        mockMvc.perform(get("/conjugueur"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Conjugueur")));
    }

    @Test
    @WithMockUser
    void knownVerb_showsTable() throws Exception {
        mockMvc.perform(get("/conjugueur").param("verbe", "manger"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("nous mangeons")))
                .andExpect(content().string(containsString("listen-btn")));
    }

    @Test
    @WithMockUser
    void unknownVerb_showsMessage() throws Exception {
        mockMvc.perform(get("/conjugueur").param("verbe", "bonjour"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("n'est pas dans notre liste")));
    }
}
