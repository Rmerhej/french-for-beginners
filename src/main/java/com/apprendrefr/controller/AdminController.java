package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.User;
import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.service.*;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final LessonService lessonService;
    private final UserService userService;
    private final ExerciseService exerciseService;
    private final VocabularyService vocabularyService;
    private final FileUploadService fileUploadService;



    public AdminController(LessonService lessonService, UserService userService,
                           ExerciseService exerciseService, VocabularyService vocabularyService,FileUploadService fileUploadService) {
        this.lessonService = lessonService;
        this.userService = userService;
        this.exerciseService = exerciseService;
        this.vocabularyService = vocabularyService;
        this.fileUploadService = fileUploadService;
    }

    @GetMapping
    public String dashboard(Model model) {
        model.addAttribute("lessonsCount", lessonService.findAll().size());
        model.addAttribute("usersCount", userService.findAll().size());
        model.addAttribute("exercisesCount", exerciseService.findAll().size());
        model.addAttribute("vocabularyCount", vocabularyService.findAll().size());
        return "admin/dashboard";
    }

    // ==================== USERS ====================

    @GetMapping("/users")
    public String listUsers(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            Model model) {

        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
        Page<User> usersPage;

        if (keyword != null && !keyword.isBlank()) {
            usersPage = userService.searchUsers(keyword, pageable);
        } else {
            usersPage = userService.findAllPaginated(pageable);
        }

        model.addAttribute("users", usersPage.getContent());
        model.addAttribute("usersPage", usersPage);
        model.addAttribute("keyword", keyword);
        return "admin/users-list";
    }
    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteById(id);
        return "redirect:/admin/users";
    }
    // Gestion avancée utilisateurs
    @GetMapping("/users/edit/{id}")
    public String editUserForm(@PathVariable Long id, Model model) {
        User user = userService.findById(id)
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));
        model.addAttribute("user", user);
        return "admin/user-form";
    }

    @PostMapping("/users/edit")
    public String updateUser(@ModelAttribute User user) {
        userService.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/users/toggle/{id}")
    public String toggleUserStatus(@PathVariable Long id) {
        userService.toggleEnabled(id);
        return "redirect:/admin/users";
    }

    @GetMapping("/users/role/{id}/{role}")
    public String changeUserRole(@PathVariable Long id, @PathVariable String role) {
        userService.changeRole(id, role);
        return "redirect:/admin/users";
    }


// ==================== LESSONS ====================

    @PostMapping("/lessons")
    public String saveLesson( @ModelAttribute Lesson lesson,

                             @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                             RedirectAttributes redirectAttributes) {

        try {
            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = fileUploadService.saveImage(imageFile);
                lesson.setImageUrl(imageUrl);
            }

            lessonService.save(lesson);
            redirectAttributes.addFlashAttribute("success", "✅ Leçon ajoutée/modifiée avec succès !");
            return "redirect:/admin/lessons";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "❌ Erreur : " + e.getMessage());
            return "redirect:/admin/lessons";
        }
    }
// ==================== GESTION DES LEÇONS ====================

    @GetMapping("/lessons")
    public String listLessons(Model model) {
        model.addAttribute("lessons", lessonService.findAll());
        return "admin/lessons-list";
    }

    @GetMapping("/lessons/new")
    public String newLessonForm(Model model) {
        model.addAttribute("lesson", new Lesson());
        return "admin/lesson-form";
    }
    // Suppression d'une leçon
    @GetMapping("/lessons/delete/{id}")
    public String deleteLesson(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            lessonService.deleteById(id);
            redirectAttributes.addFlashAttribute("success", "✅ Leçon supprimée avec succès !");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "❌ Impossible de supprimer cette leçon (elle contient peut-être du vocabulaire ou des exercices).");
        }
        return "redirect:/admin/lessons";
    }
    @GetMapping("/lessons/edit/{id}")
    public String editLessonForm(@PathVariable Long id, Model model) {
        Lesson lesson = lessonService.findById(id)
                .orElseThrow(() -> new RuntimeException("Leçon non trouvée"));
        model.addAttribute("lesson", lesson);
        return "admin/lesson-form";
    }



    // ==================== VOCABULARY ====================

    @PostMapping("/vocabulary")
    public String saveVocabulary( @ModelAttribute Vocabulary vocabulary,

                                 @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                 @RequestParam(value = "audioFile", required = false) MultipartFile audioFile,
                                 RedirectAttributes redirectAttributes) {

        try {
            if (vocabulary.getLessonId() == null) {
                redirectAttributes.addFlashAttribute("error", "❌ Veuillez sélectionner une leçon.");
                return "redirect:/admin/vocabulary/new";
            }

            // Récupérer et lier la leçon
            Lesson lesson = lessonService.findById(vocabulary.getLessonId())
                    .orElseThrow(() -> new RuntimeException("Leçon introuvable"));
            vocabulary.setLesson(lesson);

            // Upload des fichiers
            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = fileUploadService.saveImage(imageFile);
                vocabulary.setImageUrl(imageUrl);
            }

            if (audioFile != null && !audioFile.isEmpty()) {
                String audioUrl = fileUploadService.saveAudio(audioFile);
                vocabulary.setAudioUrl(audioUrl);
            }

            vocabularyService.save(vocabulary);

            redirectAttributes.addFlashAttribute("success", "✅ Mot ajouté avec succès !");
            return "redirect:/admin/vocabulary";

        } catch (Exception e) {
            e.printStackTrace();   // ← Important pour voir l’erreur dans la console
            redirectAttributes.addFlashAttribute("error", "❌ Erreur : " + e.getMessage());
            return "redirect:/admin/vocabulary/new";
        }
    }
    // 1. Liste du vocabulaire
    @GetMapping("/vocabulary")
    public String listVocabulary(Model model) {
        model.addAttribute("vocabularies", vocabularyService.findAll());
        return "admin/vocabulary-list";
    }

    // 2. Formulaire pour ajouter un nouveau mot
    @GetMapping("/vocabulary/new")
    public String newVocabularyForm(Model model) {
        model.addAttribute("vocabulary", new Vocabulary());
        model.addAttribute("lessons", lessonService.findAll());   // Pour le select des leçons
        return "admin/vocabulary-form";
    }

    @GetMapping("/vocabulary/edit/{id}")
    public String editVocabularyForm(@PathVariable Long id, Model model) {
        Vocabulary vocab = vocabularyService.findById(id)
                .orElseThrow(() -> new RuntimeException("Mot non trouvé"));
        model.addAttribute("vocabulary", vocab);
        model.addAttribute("lessons", lessonService.findAll());
        return "admin/vocabulary-form";
    }


    @GetMapping("/vocabulary/delete/{id}")
    public String deleteVocabulary(@PathVariable Long id) {
        vocabularyService.deleteById(id);
        return "redirect:/admin/vocabulary";
    }



    // ==================== EXERCISES ====================
    @GetMapping("/exercises")
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

    @GetMapping("/exercises/new")
    public String newExerciseForm(Model model) {
        model.addAttribute("exercise", new Exercise());
        return "admin/exercise-form";
    }

    @GetMapping("/exercises/edit/{id}")
    public String editExerciseForm(@PathVariable Long id, Model model) {
        Exercise exercise = exerciseService.findById(id)
                .orElseThrow(() -> new RuntimeException("Exercice non trouvé"));
        model.addAttribute("exercise", exercise);
        return "admin/exercise-form";
    }

    @PostMapping("/exercises")
    public String saveExercise(@ModelAttribute Exercise exercise) {
        exerciseService.save(exercise);
        return "redirect:/admin/exercises";
    }

    @GetMapping("/exercises/delete/{id}")
    public String deleteExercise(@PathVariable Long id) {
        exerciseService.deleteById(id);
        return "redirect:/admin/exercises";
    }

}