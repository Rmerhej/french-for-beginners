package com.apprendrefr.repository;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.FrenchForBeginnersApplication;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(classes = FrenchForBeginnersApplication.class)
@ActiveProfiles("test")
class LessonRepositoryTest {

    @Autowired
    private LessonRepository lessonRepository;

    @Test
    void shouldSaveAndFindLesson() {

        Lesson lesson = new Lesson();
        lesson.setTitle("Salutations");
        lesson.setLevel("A1");
        lesson.setContent("Bonjour");

        lessonRepository.save(lesson);

        List<Lesson> lessons = lessonRepository.findByLevel("A1");

        assertThat(lessons).hasSize(1);
        assertThat(lessons.get(0).getTitle())
                .isEqualTo("Salutations");
    }
}