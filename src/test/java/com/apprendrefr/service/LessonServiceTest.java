package com.apprendrefr.service;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.repository.LessonRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class LessonServiceTest {

    @Mock
    private LessonRepository lessonRepository;

    @InjectMocks
    private LessonService lessonService;

    private Lesson lesson;

    @BeforeEach
    void setUp() {
        lesson = new Lesson();
        lesson.setId(1L);
        lesson.setTitle("Les articles définis");
        lesson.setContent("Le, la, les...");
        lesson.setLevel("A1");
    }

    @Test
    void findAll_returnsList() {
        when(lessonRepository.findAll()).thenReturn(List.of(lesson));

        List<Lesson> result = lessonService.findAll();

        assertEquals(1, result.size());
        assertEquals("Les articles définis", result.get(0).getTitle());
    }

    @Test
    void findById_found() {
        when(lessonRepository.findById(1L)).thenReturn(Optional.of(lesson));

        Optional<Lesson> result = lessonService.findById(1L);

        assertTrue(result.isPresent());
    }

    @Test
    void save_success() {
        when(lessonRepository.save(any(Lesson.class))).thenReturn(lesson);

        Lesson saved = lessonService.save(lesson);

        assertNotNull(saved);
        verify(lessonRepository).save(lesson);
    }

    @Test
    void deleteById_success() {
        doNothing().when(lessonRepository).deleteById(1L);

        lessonService.deleteById(1L);

        verify(lessonRepository).deleteById(1L);
    }

    @Test
    void searchLessons_withKeyword() {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Lesson> page = new PageImpl<>(List.of(lesson));

        when(lessonRepository.findByTitleContainingIgnoreCaseOrContentContainingIgnoreCase(
                "articles", "articles", pageable)).thenReturn(page);

        Page<Lesson> result = lessonService.searchLessons("articles", pageable);

        assertEquals(1, result.getTotalElements());
    }

    @Test
    void searchLessons_emptyKeyword_returnsAll() {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Lesson> page = new PageImpl<>(List.of(lesson));

        when(lessonRepository.findAll(pageable)).thenReturn(page);

        Page<Lesson> result = lessonService.searchLessons("   ", pageable);

        assertEquals(1, result.getTotalElements());
        verify(lessonRepository).findAll(pageable);
    }
}
