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

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class LessonServiceTest {

    @Mock
    private LessonRepository lessonRepository;

    @InjectMocks
    private LessonService lessonService;

    private Lesson lesson1;
    private Lesson lesson2;

    @BeforeEach
    void setUp() {
        lesson1 = new Lesson();
        lesson1.setId(1L);
        lesson1.setTitle("Salutations");
        lesson1.setContent("Bonjour, comment ça va ?");
        lesson1.setLevel("A1");

        lesson2 = new Lesson();
        lesson2.setId(2L);
        lesson2.setTitle("Se présenter");
        lesson2.setContent("Je m'appelle...");
        lesson2.setLevel("A1");
    }

    @Test
    void shouldReturnAllLessons() {
        when(lessonRepository.findAll()).thenReturn(Arrays.asList(lesson1, lesson2));

        List<Lesson> result = lessonService.findAll();

        assertThat(result).hasSize(2);
        assertThat(result).containsExactly(lesson1, lesson2);
        verify(lessonRepository, times(1)).findAll();
    }

    @Test
    void shouldReturnLessonById() {
        when(lessonRepository.findById(1L)).thenReturn(Optional.of(lesson1));

        Optional<Lesson> result = lessonService.findById(1L);

        assertThat(result).isPresent();
        assertThat(result.get().getTitle()).isEqualTo("Salutations");
        assertThat(result.get().getLevel()).isEqualTo("A1");
    }

    @Test
    void shouldReturnEmptyWhenLessonNotFound() {
        when(lessonRepository.findById(99L)).thenReturn(Optional.empty());

        Optional<Lesson> result = lessonService.findById(99L);

        assertThat(result).isEmpty();
    }

    @Test
    void shouldSaveLesson() {
        when(lessonRepository.save(any(Lesson.class))).thenReturn(lesson1);

        Lesson result = lessonService.save(lesson1);

        assertThat(result).isNotNull();
        assertThat(result.getTitle()).isEqualTo("Salutations");
        verify(lessonRepository, times(1)).save(lesson1);
    }

    @Test
    void shouldReturnPaginatedLessons() {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Lesson> page = new PageImpl<>(Arrays.asList(lesson1, lesson2));

        when(lessonRepository.findAll(pageable)).thenReturn(page);

        Page<Lesson> result = lessonService.findAll(pageable);

        assertThat(result.getContent()).hasSize(2);
        assertThat(result.getTotalElements()).isEqualTo(2);
    }

    @Test
    void shouldDeleteLessonById() {
        doNothing().when(lessonRepository).deleteById(1L);

        lessonService.deleteById(1L);

        verify(lessonRepository, times(1)).deleteById(1L);
    }
}