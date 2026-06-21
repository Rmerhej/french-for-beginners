package com.apprendrefr.repository;

import com.apprendrefr.entity.Quiz;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {

    // Cherche uniquement par le titre du quiz
    Page<Quiz> findByTitleContainingIgnoreCase(String title, Pageable pageable);

    // Si vous voulez chercher par plusieurs critères, utilisez la logique OR sur les champs existants
    Page<Quiz> findByTitleContainingIgnoreCaseOrSentenceContainingIgnoreCase(
            String title, String sentence, Pageable pageable);

        // Ajout de cette méthode pour supporter la recherche par titre
        List<Quiz> findByTitleContainingIgnoreCase(String title);

}