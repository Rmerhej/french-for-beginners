package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.LessonService;
import com.apprendrefr.service.ScoreService;
import com.apprendrefr.service.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ExerciseController {

    private final ExerciseService exerciseService;
    private final UserService userService;
    private final ScoreService scoreService;
    private final LessonService lessonService;

    // injection automatique des 3 services
    public ExerciseController(ExerciseService exerciseService,
                              UserService userService,
                              ScoreService scoreService, LessonService lessonService) {
        this.exerciseService = exerciseService;
        this.userService = userService;
        this.scoreService = scoreService;
        this.lessonService = lessonService;
    }

    /*###############################################*/

    @GetMapping("/admin/exercises")
    public String listExercises(@RequestParam(defaultValue = "0") int page,
                                @RequestParam(defaultValue = "10") int size,
                                @RequestParam(required = false) String keyword,
                                Model model) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
        Page<Exercise> exercisesPage;

        if (keyword != null && !keyword.isBlank()) {
            exercisesPage = exerciseService.searchExercises(keyword, pageable);
        } else {
            exercisesPage = exerciseService.findAllPaginated(pageable);
        }

        model.addAttribute("exercises", exercisesPage.getContent());
        model.addAttribute("exercisesPage", exercisesPage);
        model.addAttribute("keyword", keyword);
        return "admin/exercises-list";
    }

    @GetMapping("/admin/exercises/new")
    public String newExerciseForm(Model model) {
        model.addAttribute("exercise", new Exercise());
        model.addAttribute("lessons", lessonService.findAll());
        return "admin/exercise-form";
    }

    @PostMapping("/admin/exercises")
    public String saveExercise(@ModelAttribute Exercise exercise, RedirectAttributes redirectAttributes) {

        try {
            exerciseService.save(exercise);
            redirectAttributes.addFlashAttribute("success", "✅ Exercice enregistré avec succès !");
            return "redirect:/admin/exercises";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "❌ Erreur : " + e.getMessage());
            return "redirect:/admin/exercises/new";
        }
    }

    @GetMapping("/admin/exercises/edit/{id}")
    public String editExercise(@PathVariable Long id, Model model) {
        Exercise exercise = exerciseService.findById(id)
                .orElseThrow(() -> new RuntimeException("Exercice non trouvé"));
        model.addAttribute("exercise", exercise);
        model.addAttribute("lessons", lessonService.findAll());
        return "admin/exercise-form";
    }

    @GetMapping("/admin/exercises/delete/{id}")
    public String deleteExercise(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            exerciseService.deleteById(id);
            redirectAttributes.addFlashAttribute("success", "✅ Exercice supprimé !");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "❌ Impossible de supprimer cet exercice.");
        }
        return "redirect:/admin/exercises";
    }
    /*###############*/

    @GetMapping("/culture")
    public String getCulturePage(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Culture");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "culture";
    }
}