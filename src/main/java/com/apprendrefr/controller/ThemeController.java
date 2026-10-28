package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Theme;
import com.apprendrefr.exception.ResourceNotFoundException;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.FileUploadService;
import com.apprendrefr.service.QuizService;
import com.apprendrefr.service.ThemeService;
import com.apprendrefr.util.AdminPaging;
import com.apprendrefr.util.ThemeIcons;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class ThemeController {

    private final ThemeService themeService;
    private final QuizService quizService;
    private final ExerciseService exerciseService;
    private final FileUploadService fileUploadService;

    public ThemeController(
            ThemeService themeService,
            QuizService quizService,
            ExerciseService exerciseService,
            FileUploadService fileUploadService) {

        this.themeService = themeService;
        this.quizService = quizService;
        this.exerciseService = exerciseService;
        this.fileUploadService = fileUploadService;
    }

    // =========================================================
    // THEMES PUBLICS
    // =========================================================

    @GetMapping("/themes")
    public String listThemes(Model model) {

        List<Theme> themes = themeService.findAll();
        model.addAttribute("themes", themes);

        // Une icône par leçon, choisie d'après son titre
        Map<Long, String> icons = new HashMap<>();
        for (Theme theme : themes) {
            icons.put(theme.getId(), ThemeIcons.forTitle(theme.getTitle()));
        }
        model.addAttribute("icons", icons);

        return "themes";
    }

    @GetMapping("/themes/{nom}")
    public String showTheme(
            @PathVariable String nom,
            Model model) {

        Theme theme = themeService.findByNom(nom)
                .orElseThrow(() ->
                        new ResourceNotFoundException("Thème non trouvé"));

        model.addAttribute("theme", theme);

        // Quiz associés au thème
        model.addAttribute(
                "quizzes",
                quizService.findByTitleContainingIgnoreCase(theme.getNom())
        );

        // Exercices associés au thème
        List<Exercise> exercises =
                exerciseService.findByLessonTitleContaining(theme.getNom());

        model.addAttribute(
                "exercises",
                exercises != null ? exercises : new ArrayList<>()
        );

        return "theme-detail";
    }

    // =========================================================
    // ADMIN - LISTE DES THEMES
    // =========================================================

    @GetMapping("/admin/themes")
    public String listThemesForAdmin(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            Model model) {

        Pageable pageable = AdminPaging.newestFirst(page, size);

        Page<Theme> themesPage =
                themeService.searchThemes(keyword, pageable);

        model.addAttribute("themesPage", themesPage);
        model.addAttribute("themes", themesPage.getContent());
        model.addAttribute("keyword", keyword);

        return "admin/themes-list";
    }

    // =========================================================
    // ADMIN - CREATION D'UN THEME
    // =========================================================

    @GetMapping("/admin/theme/new")
    public String showCreateThemeForm(Model model) {

        model.addAttribute("theme", new Theme());

        return "admin/theme-form-create";
    }

    @PostMapping("/admin/theme/new")
    public String createTheme(
            @ModelAttribute Theme theme,
            @RequestParam("audioFile") MultipartFile audioFile) {

        // Upload de l'audio
        if (audioFile != null && !audioFile.isEmpty()) {

            String audioPath = fileUploadService.saveAudio(audioFile);

            // Enregistrement du chemin dans Theme
            theme.setAudio(audioPath);
        }

        // Sauvegarde du thème en base
        themeService.save(theme);

        return "redirect:/admin/themes";
    }

    // =========================================================
    // ADMIN - MODIFICATION D'UN THEME
    // =========================================================

    @GetMapping("/admin/theme/edit/{id}")
    public String showEditThemeForm(
            @PathVariable Long id,
            Model model) {

        Optional<Theme> opt = themeService.findById(id);

        if (opt.isPresent()) {
            model.addAttribute("theme", opt.get());

            return "admin/theme-edit";
        }

        return "redirect:/admin/themes";
    }

    @PostMapping("/admin/theme/edit/{id}")
    public String updateTheme(
            @PathVariable Long id,
            @ModelAttribute Theme form,
            @RequestParam(value = "audioFile", required = false) MultipartFile audioFile) {

        Optional<Theme> opt = themeService.findById(id);
        if (opt.isEmpty()) {
            return "redirect:/admin/themes";
        }

        // On modifie le thème existant : seuls les champs du formulaire changent,
        // l'audio actuel est conservé si aucun nouveau fichier n'est envoyé.
        Theme theme = opt.get();
        String oldAudio = theme.getAudio();
        theme.setTitle(form.getTitle());
        theme.setNom(form.getNom());
        theme.setDialogueContent(form.getDialogueContent());

        // Le service ne garde que les formats audio autorisés et donne un nom aléatoire au fichier
        String newAudio = fileUploadService.saveAudio(audioFile);
        if (newAudio != null) {
            theme.setAudio(newAudio);
        }

        themeService.save(theme);

        // Après l'enregistrement seulement : l'ancien fichier ne sert plus, on libère la place sur le disque
        if (newAudio != null) {
            removeAudioIfUnused(oldAudio, id);
        }

        return "redirect:/admin/themes";
    }

    // =========================================================
    // ADMIN - SUPPRESSION D'UN THEME
    // =========================================================

    @PostMapping("/admin/theme/delete/{id}")
    public String deleteTheme(@PathVariable Long id) {

        String audio = themeService.findById(id).map(Theme::getAudio).orElse(null);

        themeService.deleteById(id);

        removeAudioIfUnused(audio, id);

        return "redirect:/admin/themes";
    }

    /** Supprime un fichier audio envoyé par l'application, sauf si un autre thème l'utilise encore. */
    private void removeAudioIfUnused(String audioPath, Long themeId) {
        if (audioPath != null && !themeService.isAudioUsedByAnotherTheme(audioPath, themeId)) {
            fileUploadService.deleteAudio(audioPath);
        }
    }
}

