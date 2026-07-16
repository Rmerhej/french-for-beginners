package com.apprendrefr.repository;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Quiz;
import com.apprendrefr.entity.Theme;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ThemeRepository extends JpaRepository<Theme, Long> {
    Optional<Theme> findByNom(String nom);

}