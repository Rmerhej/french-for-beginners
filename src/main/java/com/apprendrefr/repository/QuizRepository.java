package com.apprendrefr.repository;

import com.apprendrefr.entity.Quiz;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {

    // Cherche uniquement par le titre
    Page<Quiz> findByTitleContainingIgnoreCase(String title, Pageable pageable);

    List<Quiz> findByTitleContainingIgnoreCase(String title);

    List<Quiz> findByTitleIgnoreCase(String title);

    //  chercher par plusieurs critères,  la logique OR sur les champs existants
    Page<Quiz> findByTitleContainingIgnoreCaseOrSentenceContainingIgnoreCase(
            String title, String sentence, Pageable pageable);


}