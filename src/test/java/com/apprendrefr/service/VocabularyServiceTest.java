package com.apprendrefr.service;


import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.repository.VocabularyRepository;
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

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;


@ExtendWith(MockitoExtension.class)
class VocabularyServiceTest {


    @Mock
    private VocabularyRepository vocabularyRepository;


    @InjectMocks
    private VocabularyService vocabularyService;


    private Vocabulary vocabulary;


    @BeforeEach
    void setUp() {


        vocabulary = new Vocabulary();

        vocabulary.setId(1L);
        vocabulary.setFrenchWord("bonjour");
        vocabulary.setEnglishTranslation("hello");
        vocabulary.setPronunciation("bon-jour");
        vocabulary.setExampleSentence("Bonjour, comment allez-vous ?");

    }


    @Test
    void count_shouldReturnNumberOfVocabulary() {


        when(vocabularyRepository.count())
                .thenReturn(25L);


        long result =
                vocabularyService.count();


        assertThat(result)
                .isEqualTo(25L);


        verify(vocabularyRepository)
                .count();
    }


    @Test
    void findAll_shouldReturnVocabularyList() {


        when(vocabularyRepository.findAll())
                .thenReturn(List.of(vocabulary));


        List<Vocabulary> result =
                vocabularyService.findAll();


        assertThat(result)
                .hasSize(1);


        assertThat(result.get(0).getFrenchWord())
                .isEqualTo("bonjour");


        verify(vocabularyRepository)
                .findAll();
    }


    @Test
    void findAllPaginated_shouldReturnPage() {


        Page<Vocabulary> page =
                new PageImpl<>(List.of(vocabulary));


        when(vocabularyRepository.findAll(any(Pageable.class)))
                .thenReturn(page);


        Page<Vocabulary> result =
                vocabularyService.findAllPaginated(
                        PageRequest.of(0, 10)
                );


        assertThat(result.getContent())
                .hasSize(1);


        verify(vocabularyRepository)
                .findAll(any(Pageable.class));
    }


    @Test
    void findById_shouldReturnVocabulary() {


        when(vocabularyRepository.findById(1L))
                .thenReturn(Optional.of(vocabulary));


        Optional<Vocabulary> result =
                vocabularyService.findById(1L);


        assertThat(result)
                .isPresent();


        assertThat(result.get().getFrenchWord())
                .isEqualTo("bonjour");


        verify(vocabularyRepository)
                .findById(1L);
    }


    @Test
    void findByLessonId_shouldReturnVocabularyList() {


        when(vocabularyRepository.findByLesson_Id(1L))
                .thenReturn(List.of(vocabulary));


        List<Vocabulary> result =
                vocabularyService.findByLessonId(1L);


        assertThat(result)
                .hasSize(1);


        verify(vocabularyRepository)
                .findByLesson_Id(1L);
    }


    @Test
    void searchVocabulary_shouldReturnPage() {


        Page<Vocabulary> page =
                new PageImpl<>(List.of(vocabulary));


        when(
                vocabularyRepository
                        .findByFrenchWordContainingIgnoreCaseOrEnglishTranslationContainingIgnoreCase(
                                eq("bonjour"),
                                eq("bonjour"),
                                any(Pageable.class)
                        )
        )
                .thenReturn(page);


        Page<Vocabulary> result =
                vocabularyService.searchVocabulary(
                        "bonjour",
                        PageRequest.of(0, 10)
                );


        assertThat(result.getContent())
                .hasSize(1);


        assertThat(result.getContent()
                .get(0)
                .getFrenchWord())
                .isEqualTo("bonjour");
    }


    @Test
    void save_shouldSaveVocabulary() {


        when(vocabularyRepository.save(vocabulary))
                .thenReturn(vocabulary);


        Vocabulary result =
                vocabularyService.save(vocabulary);


        assertThat(result)
                .isNotNull();


        assertThat(result.getEnglishTranslation())
                .isEqualTo("hello");


        verify(vocabularyRepository)
                .save(vocabulary);
    }


    @Test
    void deleteById_shouldDeleteVocabulary() {


        vocabularyService.deleteById(1L);


        verify(vocabularyRepository)
                .deleteById(1L);
    }


}