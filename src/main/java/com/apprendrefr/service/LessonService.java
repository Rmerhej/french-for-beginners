package com.apprendrefr.service;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.repository.LessonRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class LessonService {

    private final LessonRepository lessonRepository;

    public LessonService(LessonRepository lessonRepository) {
        this.lessonRepository = lessonRepository;
    }

    public List<Lesson> findAll() {
        return lessonRepository.findAll();
    }

    public Page<Lesson> findAllPaginated(Pageable pageable) {
        return lessonRepository.findAll(pageable);
    }

    public Optional<Lesson> findById(Long id) {
        return lessonRepository.findById(id);
    }

    public Lesson save(Lesson lesson) {
        return lessonRepository.save(lesson);
    }

    public long count() {
        return lessonRepository.count();
    }


    public Page<Lesson> searchLessons(String keyword, Pageable pageable) {
        return lessonRepository.findByTitleContainingIgnoreCaseOrContentContainingIgnoreCase(
                keyword, keyword, pageable);
    }
    public void deleteById(Long id) {

        lessonRepository.deleteById(id);
    }

}