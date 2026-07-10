package com.apprendrefr.repository;

import com.apprendrefr.entity.Vocabulary;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VocabularyRepository extends JpaRepository<Vocabulary, Long> {

    List<Vocabulary> findByLesson_Id(Long lessonId);

    List<Vocabulary> findByFrenchWordContainingIgnoreCase(String frenchWord);

    Page<Vocabulary> findAll(Pageable pageable);

    Page<Vocabulary> findByFrenchWordContainingIgnoreCaseOrEnglishTranslationContainingIgnoreCase(
            String frenchWord, String englishTranslation, Pageable pageable);
}