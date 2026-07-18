package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Theme;
import com.apprendrefr.repository.QuizRepository;
import com.apprendrefr.repository.ThemeRepository;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.ThemeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/themes")
public class ThemeController {

    private final ThemeService themeService;
    private final QuizRepository quizRepository;
    private final ExerciseService exerciseService;

    public ThemeController(ThemeService themeService, ThemeRepository themeRepository, QuizRepository quizRepository, ExerciseService exerciseService) {
        this.themeService = themeService;
        this.quizRepository = quizRepository;
        this.exerciseService = exerciseService;
    }

    @GetMapping
    public String listThemes(Model model) {

        var themes = themeService.findAll();
        model.addAttribute("themes", themeService.findAll());

        return "themes";
    }


    @GetMapping("/{nom}")
    public String showTheme(@PathVariable String nom, Model model) {
        Theme theme = themeService.findByNom(nom)
                .orElseThrow(() -> new RuntimeException("Thème non trouvé"));

        model.addAttribute("theme", theme);
        model.addAttribute("quizzes",
                quizRepository.findByTitleContainingIgnoreCase(theme.getNom()));

        List<Exercise> exercises = exerciseService.findByLessonTitleContaining(theme.getNom());
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        model.addAttribute("exercises",
                exerciseService.findByLessonTitleContaining(theme.getNom()));
        return "theme-detail";
    }

}