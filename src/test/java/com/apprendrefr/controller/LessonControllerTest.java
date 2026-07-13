package com.apprendrefr.controller;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.LessonService;
import com.apprendrefr.service.VocabularyService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(LessonController.class)   // Test uniquement le controller + ses dépendances web
class LessonControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private LessonService lessonService;

    @MockitoBean
    private VocabularyService vocabularyService;

    @MockitoBean
    private ExerciseService exerciseService;

    private List<Lesson> lessons;

    @BeforeEach
    void setUp() {

        Lesson lesson1 = new Lesson();
        lesson1.setId(1L);
        lesson1.setTitle("Bonjour");
        lesson1.setContent("Première leçon");
        lesson1.setLevel("A1");
        lesson1.setCategory("Grammaire");

        Lesson lesson2 = new Lesson();
        lesson2.setId(2L);
        lesson2.setTitle("Les verbes");
        lesson2.setContent("Deuxième leçon");
        lesson2.setLevel("A2");
        lesson2.setCategory("Conjugaison");

        lessons = List.of(lesson1, lesson2);
    }

    @Test
    @WithMockUser(username = "user", roles = "USER")
        // Simule un utilisateur connecté
    void shouldReturnLessonsPage() throws Exception {
        // Given
        when(lessonService.findAll()).thenReturn(lessons);

        // When + Then
        mockMvc.perform(get("/lessons"))
                .andExpect(status().isOk())
                .andExpect(view().name("lessons"))           // nom de ta vue Thymeleaf
                .andExpect(model().attributeExists("lessons"))
                .andExpect(model().attribute("lessons", lessons));
    }

    @Test
    @WithMockUser
    void shouldReturnLessonDetail() throws Exception {

        Lesson lesson = lessons.get(0);

        when(lessonService.findById(1L))
                .thenReturn(Optional.of(lesson));

        mockMvc.perform(get("/lesson/1"))
                .andExpect(status().isOk())
                .andExpect(view().name("lesson-detail"))
                .andExpect(model().attribute("lesson", lesson));
    }

    @Test
    void shouldRedirectToLoginWhenNotAuthenticated() throws Exception {
        mockMvc.perform(get("/lessons"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrlPattern("**/login**"));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void shouldAllowAdminAccessToAdminLessons() throws Exception {

        Page<Lesson> page = new PageImpl<>(lessons);

        when(lessonService.findAll(any(Pageable.class)))
                .thenReturn(page);

        mockMvc.perform(get("/admin/lessons-list"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/lessons"))
                .andExpect(model().attributeExists("lessons"));
    }
}