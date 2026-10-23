package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
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
class AdvancedCoursesIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @ParameterizedTest
    @WithMockUser
    @CsvSource({
            "/accordsApprofondis, Les accords approfondis",
            "/expressionsTempsApprofondies, Les expressions de temps approfondies",
            "/verbesReguliersApprofondis, Les verbes réguliers approfondis",
            "/auxiliairesApprofondis, Les auxiliaires approfondis",
            "/adverbesApprofondis, Les adverbes approfondis"
    })
    void advancedCourse_rendersWithItsTitle(String url, String title) throws Exception {
        mockMvc.perform(get(url))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString(title)));
    }

    @Test
    @WithMockUser
    void advancedCourses_appearInTheCoursePath() throws Exception {
        mockMvc.perform(get("/supports-de-cours"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("/accordsApprofondis")))
                .andExpect(content().string(containsString("/auxiliairesApprofondis")))
                .andExpect(content().string(containsString("/adverbesApprofondis")));
    }
}
