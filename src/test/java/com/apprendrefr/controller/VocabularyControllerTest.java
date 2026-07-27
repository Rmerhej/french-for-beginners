package com.apprendrefr.controller;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.repository.*;
import com.apprendrefr.service.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;


@WebMvcTest(controllers = VocabularyController.class)   // ← This is critical
@AutoConfigureMockMvc(addFilters = false)

class VocabularyControllerTest {


    @Autowired
    private MockMvc mockMvc;


    @MockitoBean
    private LessonService lessonService;
    @MockitoBean
    private LessonRepository lessonRepository;
    @MockitoBean
    private VocabularyService vocabularyService;
    @MockitoBean
    private VocabularyRepository vocabularyRepository;
    @MockitoBean
    private UserRepository userRepository;
    @MockitoBean
    private PrononciationRepository prononciationRepository;
    @MockitoBean
    private ExerciseRepository exerciseRepository;
    @MockitoBean
    private ThemeRepository themeRepository;
    @MockitoBean
    private QuizRepository quizRepository;

    @MockitoBean
    private FileUploadService fileUploadService;


    @Test
    @WithMockUser(roles = "ADMIN")
    void listVocabulary_shouldReturnVocabularyList() throws Exception {

        Vocabulary vocabulary = new Vocabulary();
        vocabulary.setId(1L);
        vocabulary.setFrenchWord("bonjour");
        vocabulary.setEnglishTranslation("hello");


        when(vocabularyService.findAll())
                .thenReturn(List.of(vocabulary));


        mockMvc.perform(get("/admin/vocabulary"))

                .andExpect(status().isOk())
                .andExpect(view().name("admin/vocabulary-list"))
                .andExpect(model().attributeExists("vocabularies"));
    }


    @Test
    void listVocabulary_shouldSearchVocabulary() throws Exception {


        Page<Vocabulary> page =
                new PageImpl<>(List.of());


        when(vocabularyService.searchVocabulary(
                eq("bonjour"),
                any(Pageable.class)))
                .thenReturn(page);


        mockMvc.perform(get("/admin/vocabulary")
                        .param("keyword", "bonjour"))

                .andExpect(status().isOk())
                .andExpect(view().name("admin/vocabulary-list"))
                .andExpect(model().attributeExists("vocabularies"))
                .andExpect(model().attribute("keyword", "bonjour"));
    }


    @Test
    void newVocabularyForm_shouldReturnForm() throws Exception {


        when(lessonService.findAll())
                .thenReturn(Collections.emptyList());


        mockMvc.perform(get("/admin/vocabulary/new"))

                .andExpect(status().isOk())
                .andExpect(view().name("admin/vocabulary-form"))
                .andExpect(model().attributeExists("vocabulary"))
                .andExpect(model().attributeExists("lessons"));
    }


    @Test
    void editVocabularyForm_shouldReturnForm() throws Exception {


        Vocabulary vocabulary = new Vocabulary();

        vocabulary.setId(1L);
        vocabulary.setFrenchWord("chat");


        when(vocabularyService.findById(1L))
                .thenReturn(Optional.of(vocabulary));


        when(lessonService.findAll())
                .thenReturn(Collections.emptyList());


        mockMvc.perform(get("/admin/vocabulary/edit/1"))

                .andExpect(status().isOk())
                .andExpect(view().name("admin/vocabulary-form"))
                .andExpect(model().attributeExists("vocabulary"))
                .andExpect(model().attributeExists("lessons"));
    }


    @Test
    void deleteVocabulary_shouldRedirect() throws Exception {


        mockMvc.perform(get("/admin/vocabulary/delete/1"))

                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/vocabulary"));


        verify(vocabularyService)
                .deleteById(1L);
    }


    @Test
    void saveVocabulary_shouldCreateVocabulary() throws Exception {


        Lesson lesson = new Lesson();
        lesson.setId(1L);


        when(lessonService.findById(1L))
                .thenReturn(Optional.of(lesson));


        when(vocabularyService.save(any(Vocabulary.class)))
                .thenAnswer(invocation -> invocation.getArgument(0));


        mockMvc.perform(multipart("/admin/vocabulary")

                        .param("frenchWord", "bonjour")
                        .param("englishTranslation", "hello")
                        .param("lessonId", "1"))

                .andExpect(status().is3xxRedirection())

                .andExpect(redirectedUrl("/admin/vocabulary"));


        verify(vocabularyService)
                .save(any(Vocabulary.class));
    }


    @Test
    void saveVocabulary_shouldRedirectWhenLessonIsMissing() throws Exception {


        mockMvc.perform(multipart("/admin/vocabulary")

                        .param("frenchWord", "bonjour")
                        .param("englishTranslation", "hello"))

                .andExpect(status().is3xxRedirection())

                .andExpect(redirectedUrl("/admin/vocabulary/new"));


        verify(vocabularyService, never())
                .save(any());
    }


    @Test
    void saveVocabulary_shouldUploadFiles() throws Exception {


        Lesson lesson = new Lesson();
        lesson.setId(1L);


        when(lessonService.findById(1L))
                .thenReturn(Optional.of(lesson));


        when(fileUploadService.saveImage(any()))
                .thenReturn("/uploads/image.jpg");


        when(fileUploadService.saveAudio(any()))
                .thenReturn("/uploads/audio.mp3");


        MockMultipartFile image =
                new MockMultipartFile(
                        "imageFile",
                        "image.jpg",
                        "image/jpeg",
                        "image-content".getBytes()
                );


        MockMultipartFile audio =
                new MockMultipartFile(
                        "audioFile",
                        "audio.mp3",
                        "audio/mpeg",
                        "audio-content".getBytes()
                );


        mockMvc.perform(multipart("/admin/vocabulary")

                        .file(image)
                        .file(audio)

                        .param("frenchWord", "chat")
                        .param("englishTranslation", "cat")
                        .param("lessonId", "1"))

                .andExpect(status().is3xxRedirection())

                .andExpect(redirectedUrl("/admin/vocabulary"));


        verify(fileUploadService)
                .saveImage(any());

        verify(fileUploadService)
                .saveAudio(any());

    }

}