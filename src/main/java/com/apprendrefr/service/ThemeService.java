package com.apprendrefr.service;

import com.apprendrefr.entity.Theme;
import com.apprendrefr.repository.ThemeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ThemeService {

    private final ThemeRepository themeRepository;

    @Autowired
    public ThemeService(ThemeRepository themeRepository) {
        this.themeRepository = themeRepository;
    }

    public List<Theme> findAll() {
        return themeRepository.findAll();
    }

    public Optional<Theme> findByNom(String nom) {
        return themeRepository.findByNom(nom);
    }

    public Optional<Theme> findById(Long id) {
        return themeRepository.findById(id);
    }


    public void deleteById(Long id) {
        themeRepository.deleteById(id);
    }

    public Theme getFirstTheme() {
        return themeRepository.findAll().stream().findFirst().orElse(new Theme());
    }

    public Page<Theme> searchThemes(String keyword, Pageable pageable) {

        if (keyword == null || keyword.trim().isEmpty()) {
            return themeRepository.findAll(pageable);
        }

        return themeRepository.findByTitleContainingIgnoreCase(
                keyword.trim(),
                pageable
        );
    }
    public long count() {
        return themeRepository.count();
    }
    public Theme save(Theme theme) {
        return themeRepository.save(theme);
    }

}