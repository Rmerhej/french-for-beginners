package com.apprendrefr.service;

import com.apprendrefr.entity.Theme;
import com.apprendrefr.repository.ThemeRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class ThemeServiceTest {

    @Mock
    private ThemeRepository themeRepository;

    @InjectMocks
    private ThemeService themeService;

    private Theme theme;

    @BeforeEach
    void setUp() {
        theme = new Theme();
        theme.setId(1L);
        theme.setNom("restaurant");
        theme.setTitle("Au restaurant");
        theme.setDialogueContent("Bonjour, une table pour deux s'il vous plaît.");
    }

    @Test
    void findAll_returnsList() {
        when(themeRepository.findAll()).thenReturn(List.of(theme));

        List<Theme> result = themeService.findAll();

        assertEquals(1, result.size());
        assertEquals("Au restaurant", result.get(0).getTitle());
    }

    @Test
    void findById_found() {
        when(themeRepository.findById(1L)).thenReturn(Optional.of(theme));

        Optional<Theme> result = themeService.findById(1L);

        assertTrue(result.isPresent());
        assertEquals("restaurant", result.get().getNom());
    }

    @Test
    void findByNom_found() {
        when(themeRepository.findByNom("restaurant")).thenReturn(Optional.of(theme));

        Optional<Theme> result = themeService.findByNom("restaurant");

        assertTrue(result.isPresent());
    }

    @Test
    void save_success() {
        when(themeRepository.save(any(Theme.class))).thenReturn(theme);

        Theme saved = themeService.save(theme);

        assertNotNull(saved);
        verify(themeRepository).save(theme);
    }

    @Test
    void deleteById_success() {
        doNothing().when(themeRepository).deleteById(1L);

        themeService.deleteById(1L);

        verify(themeRepository).deleteById(1L);
    }

    @Test
    void searchThemes_withKeyword() {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Theme> page = new PageImpl<>(List.of(theme));

        when(themeRepository.findByTitleContainingIgnoreCase("restaurant", pageable))
                .thenReturn(page);

        Page<Theme> result = themeService.searchThemes("restaurant", pageable);

        assertEquals(1, result.getTotalElements());
    }

    @Test
    void searchThemes_emptyKeyword_returnsAll() {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Theme> page = new PageImpl<>(List.of(theme));

        when(themeRepository.findAll(pageable)).thenReturn(page);

        Page<Theme> result = themeService.searchThemes(null, pageable);

        assertEquals(1, result.getTotalElements());
        verify(themeRepository).findAll(pageable);
    }

    @Test
    void getFirstTheme_whenExists() {
        when(themeRepository.findAll()).thenReturn(List.of(theme));

        Theme result = themeService.getFirstTheme();

        assertEquals("Au restaurant", result.getTitle());
    }

    @Test
    void count_returnsCorrectValue() {
        when(themeRepository.count()).thenReturn(4L);

        assertEquals(4L, themeService.count());
    }
}
