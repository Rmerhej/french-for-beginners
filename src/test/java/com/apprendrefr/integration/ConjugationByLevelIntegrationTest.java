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

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ConjugationByLevelIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void page_isOpenWithoutAccount_andListsEachLevel() throws Exception {
        mockMvc.perform(get("/conjugaison-par-niveau"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Conjugaison par niveau")))
                .andExpect(content().string(containsString("Le passé composé")))
                .andExpect(content().string(containsString("Le subjonctif présent")))
                .andExpect(content().string(containsString("/conjugueur?verbe=")));
    }
}
