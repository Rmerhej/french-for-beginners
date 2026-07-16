package com.apprendrefr.service;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Theme;
import com.apprendrefr.repository.ThemeRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ThemeService {

    private final ThemeRepository themeRepository;

    public ThemeService(ThemeRepository themeRepository) {
        this.themeRepository = themeRepository;
    }

    public List<Theme> findAll() {
        return themeRepository.findAll();
    }

    public Optional<Theme> findByNom(String nom) {
        return themeRepository.findByNom(nom);
    }

}