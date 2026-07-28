package com.apprendrefr.integration;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.repository.LessonRepository;
import com.apprendrefr.service.LessonService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
class LessonIntegrationTest {

    @Autowired
    private LessonService lessonService;

    @Autowired
    private LessonRepository lessonRepository;

    private Lesson lesson;

    @BeforeEach
    void setUp() {
        lessonRepository.deleteAll();

        lesson = new Lesson();
        lesson.setTitle("Les articles définis");
        lesson.setContent("Le, la, les, l'");
        lesson.setLevel("A1");
        lesson.setCategory("Grammaire");
    }

    @Test
    void saveAndFindById() {
        Lesson saved = lessonService.save(lesson);

        assertNotNull(saved.getId());

        Optional<Lesson> found = lessonService.findById(saved.getId());
        assertTrue(found.isPresent());
        assertEquals("Les articles définis", found.get().getTitle());
        assertEquals("A1", found.get().getLevel());
    }

    @Test
    void findAll_and_count() {
        lessonService.save(lesson);

        Lesson lesson2 = new Lesson();
        lesson2.setTitle("Les verbes au présent");
        lesson2.setContent("Je mange, tu manges...");
        lesson2.setLevel("A1");
        lessonService.save(lesson2);

        List<Lesson> all = lessonService.findAll();
        assertEquals(2, all.size());
        assertEquals(2, lessonService.count());
    }

    @Test
    void searchLessons() {
        lessonService.save(lesson);

        Page<Lesson> page = lessonService.searchLessons("articles", PageRequest.of(0, 10));

        assertEquals(1, page.getTotalElements());
        assertEquals("Les articles définis", page.getContent().get(0).getTitle());
    }

    @Test
    void deleteById() {
        Lesson saved = lessonService.save(lesson);
        Long id = saved.getId();

        lessonService.deleteById(id);

        assertTrue(lessonService.findById(id).isEmpty());
        assertEquals(0, lessonService.count());
    }
}
