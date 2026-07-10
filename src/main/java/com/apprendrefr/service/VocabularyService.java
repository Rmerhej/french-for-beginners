package com.apprendrefr.service;

import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.repository.VocabularyRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class VocabularyService {

    private final VocabularyRepository vocabularyRepository;

    public VocabularyService(VocabularyRepository vocabularyRepository) {
        this.vocabularyRepository = vocabularyRepository;
    }

    public long count() {
        return vocabularyRepository.count(); // Cette méthode existe déjà sans que vous ayez à la créer !
    }

    public List<Vocabulary> findAll() {
        return vocabularyRepository.findAll();
    }

    public Page<Vocabulary> findAllPaginated(Pageable pageable) {
        return vocabularyRepository.findAll(pageable);
    }

    public Optional<Vocabulary> findById(Long id) {
        return vocabularyRepository.findById(id);
    }

    public List<Vocabulary> findByLessonId(Long lessonId) {
        return vocabularyRepository.findByLesson_Id(lessonId);
    }


    public Page<Vocabulary> searchVocabulary(String keyword, Pageable pageable) {
        return vocabularyRepository.findByFrenchWordContainingIgnoreCaseOrEnglishTranslationContainingIgnoreCase(
                keyword, keyword, pageable);
    }

    public Vocabulary save(Vocabulary vocabulary) {
        return vocabularyRepository.save(vocabulary);
    }

    public void deleteById(Long id) {
        vocabularyRepository.deleteById(id);
    }

}