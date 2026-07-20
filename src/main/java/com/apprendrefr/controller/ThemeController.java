package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Theme;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.QuizService;
import com.apprendrefr.service.ThemeService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller

public class ThemeController {

    private final ThemeService themeService;
    private final QuizService quizService;
    private final ExerciseService exerciseService;

    public ThemeController(ThemeService themeService, QuizService quizService, ExerciseService exerciseService) {
        this.themeService = themeService;
        this.quizService = quizService;
        this.exerciseService = exerciseService;
    }

    @GetMapping("/themes")
    public String listThemes(Model model) {

        var themes = themeService.findAll();
        model.addAttribute("themes", themeService.findAll());
        return "themes";
    }


    @GetMapping("/themes/{nom}")
    public String showTheme(@PathVariable String nom, Model model) {
        Theme theme = themeService.findByNom(nom)
                .orElseThrow(() -> new RuntimeException("Thème non trouvé"));

        model.addAttribute("theme", theme);
        model.addAttribute("quizzes", quizService.findByTitleContainingIgnoreCase(theme.getNom()));

        List<Exercise> exercises = exerciseService.findByLessonTitleContaining(theme.getNom());
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        model.addAttribute("exercises", exerciseService.findByLessonTitleContaining(theme.getNom()));

        return "theme-detail";
    }

    @GetMapping("/admin/themes")
    public String listThemesForAdmin(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            Model model) {

        Pageable pageable = PageRequest.of(page, size);

        Page<Theme> themesPage = themeService.searchThemes(keyword, pageable);

        model.addAttribute("themesPage", themesPage);
        model.addAttribute("themes", themesPage.getContent());
        model.addAttribute("keyword", keyword);

        return "/admin/themes-list";
    }

    @GetMapping("/admin/theme/new")
    public String showCreateThemeForm(Model model) {
        model.addAttribute("theme", new Theme());

        return "admin/theme-form-create";
    }

    @PostMapping("/admin/theme/new")
    public String createTheme(@ModelAttribute Theme theme) {
        themeService.save(theme);
        return "redirect:/themes";
    }

    @GetMapping("/admin/theme/edit/{id}")
    public String showEditThemeForm(@PathVariable Long id, Model model) {
        Optional<Theme> opt = themeService.findById(id);
        if (opt.isPresent()) {
            model.addAttribute("theme", opt.get());
            return "admin/theme-edit";

        }
        return "redirect:/admin/themes";
    }

    @PostMapping("/admin/theme/edit/{id}")
    public String updateTheme(@PathVariable Long id, @ModelAttribute Theme theme) {
        theme.setId(id);
        themeService.save(theme);
        return "redirect:/admin/themes";
    }

    @GetMapping("/admin/theme/delete/{id}")
    public String deleteTheme(@PathVariable Long id) {
        themeService.deleteById(id);
        return "redirect:/admin/themes";
    }

}