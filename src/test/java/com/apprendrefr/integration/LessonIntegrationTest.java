package com.apprendrefr.integration;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.repository.LessonRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class LessonIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private LessonRepository lessonRepository;

    @BeforeEach
    void setUp() {
        lessonRepository.deleteAll();

        Lesson lesson1 = new Lesson();
        lesson1.setTitle("Salutations");
        lesson1.setContent("Bonjour, comment allez-vous ?");
        lesson1.setLevel("A1");
        lessonRepository.save(lesson1);

        Lesson lesson2 = new Lesson();
        lesson2.setTitle("Les nombres");
        lesson2.setContent("Un, deux, trois...");
        lesson2.setLevel("A1");
        lessonRepository.save(lesson2);
    }

    @Test
    @WithMockUser(username = "user", roles = "USER")
    void shouldAccessLessonsPageAsAuthenticatedUser() throws Exception {
        mockMvc.perform(get("/lessons"))
                .andExpect(status().isOk())
                .andExpect(view().name("lessons"))
                .andExpect(model().attributeExists("lessons"));
    }

    @Test
    void shouldRedirectUnauthenticatedUserToLogin() throws Exception {
        mockMvc.perform(get("/lessons"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrlPattern("**/login**"));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void shouldAccessAdminLessonsPage() throws Exception {
        mockMvc.perform(get("/admin/lessons"))
                .andExpect(status().isOk());
    }
}