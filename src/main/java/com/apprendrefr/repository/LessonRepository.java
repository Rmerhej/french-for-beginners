package com.apprendrefr.repository;

import com.apprendrefr.entity.Lesson;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LessonRepository extends JpaRepository<Lesson, Long> {

    List<Lesson> findByLevel(String level);

    List<Lesson> findByCategory(String category);

    List<Lesson> findByLevelAndCategory(String level, String category);

    // Recherche par titre
    List<Lesson> findByTitleContainingIgnoreCase(String title);

    Page<Lesson> findAll(Pageable pageable);

    Page<Lesson> findByTitleContainingIgnoreCaseOrContentContainingIgnoreCase(
            String title, String content, Pageable pageable);
}