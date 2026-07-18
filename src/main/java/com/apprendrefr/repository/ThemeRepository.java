package com.apprendrefr.repository;

import com.apprendrefr.entity.Theme;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ThemeRepository extends JpaRepository<Theme, Long> {
    Optional<Theme> findByNom(String nom);

    List<Theme> findByTitleContainingIgnoreCase(String title);

    Page<Theme> findByTitleContainingIgnoreCase(
            String title,
            Pageable pageable
    );

}