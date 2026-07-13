package com.apprendrefr.repository;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.Vocabulary;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


@DataJpaTest
class VocabularyRepositoryTest {


    @Autowired
    private VocabularyRepository vocabularyRepository;


    @Autowired
    private LessonRepository lessonRepository;


    private Lesson frenchLesson;

    private Vocabulary helloVocabulary;
    private Vocabulary catVocabulary;


    @BeforeEach
    void setUp() {


        vocabularyRepository.deleteAll();
        lessonRepository.deleteAll();


        frenchLesson = new Lesson();

        frenchLesson.setTitle("Français débutant");


        frenchLesson = lessonRepository.save(frenchLesson);


        helloVocabulary = new Vocabulary();

        helloVocabulary.setFrenchWord("bonjour");
        helloVocabulary.setEnglishTranslation("hello");
        helloVocabulary.setPronunciation("bon-jour");
        helloVocabulary.setExampleSentence("Bonjour, comment allez-vous ?");
        helloVocabulary.setLesson(frenchLesson);


        catVocabulary = new Vocabulary();

        catVocabulary.setFrenchWord("chat");
        catVocabulary.setEnglishTranslation("cat");
        catVocabulary.setPronunciation("cha");
        catVocabulary.setExampleSentence("Le chat dort.");
        catVocabulary.setLesson(frenchLesson);


        vocabularyRepository.save(helloVocabulary);
        vocabularyRepository.save(catVocabulary);

    }


    @Test
    void findByLesson_Id_shouldReturnVocabularyList() {


        List<Vocabulary> result =
                vocabularyRepository.findByLesson_Id(
                        frenchLesson.getId()
                );


        assertThat(result)
                .hasSize(2);


        assertThat(result.get(0).getLesson())
                .isNotNull();
    }


    @Test
    void findByFrenchWordContainingIgnoreCase_shouldFindWord() {


        List<Vocabulary> result =
                vocabularyRepository
                        .findByFrenchWordContainingIgnoreCase("BON");


        assertThat(result)
                .hasSize(1);


        assertThat(result.get(0).getFrenchWord())
                .isEqualTo("bonjour");
    }


    @Test
    void findByFrenchWordContainingIgnoreCase_shouldReturnEmptyWhenNotFound() {


        List<Vocabulary> result =
                vocabularyRepository
                        .findByFrenchWordContainingIgnoreCase("xyz");


        assertThat(result)
                .isEmpty();
    }


    @Test
    void searchVocabulary_shouldFindByFrenchWord() {


        Page<Vocabulary> result =
                vocabularyRepository
                        .findByFrenchWordContainingIgnoreCaseOrEnglishTranslationContainingIgnoreCase(
                                "chat",
                                "nothing",
                                PageRequest.of(0, 10)
                        );


        assertThat(result.getContent())
                .hasSize(1);


        assertThat(
                result.getContent()
                        .get(0)
                        .getFrenchWord()
        )
                .isEqualTo("chat");
    }


    @Test
    void searchVocabulary_shouldFindByEnglishTranslation() {


        Page<Vocabulary> result =
                vocabularyRepository
                        .findByFrenchWordContainingIgnoreCaseOrEnglishTranslationContainingIgnoreCase(
                                "nothing",
                                "hello",
                                PageRequest.of(0, 10)
                        );


        assertThat(result.getContent())
                .hasSize(1);


        assertThat(
                result.getContent()
                        .get(0)
                        .getEnglishTranslation()
        )
                .isEqualTo("hello");
    }


    @Test
    void findAllPageable_shouldReturnPage() {


        Page<Vocabulary> page =
                vocabularyRepository.findAll(
                        PageRequest.of(0, 5)
                );


        assertThat(page)
                .isNotNull();


        assertThat(page.getContent())
                .hasSize(2);
    }


    @Test
    void saveVocabulary_shouldGenerateId() {


        Vocabulary vocabulary = new Vocabulary();

        vocabulary.setFrenchWord("maison");
        vocabulary.setEnglishTranslation("house");
        vocabulary.setLesson(frenchLesson);


        Vocabulary saved =
                vocabularyRepository.save(vocabulary);


        assertThat(saved.getId())
                .isNotNull();


        assertThat(saved.getFrenchWord())
                .isEqualTo("maison");
    }


    @Test
    void deleteVocabulary_shouldRemoveVocabulary() {


        Long id =
                helloVocabulary.getId();


        vocabularyRepository.deleteById(id);


        assertThat(
                vocabularyRepository.findById(id)
        )
                .isEmpty();
    }

}