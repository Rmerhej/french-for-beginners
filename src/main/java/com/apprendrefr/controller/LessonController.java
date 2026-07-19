package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.FileUploadService;
import com.apprendrefr.service.LessonService;
import com.apprendrefr.service.VocabularyService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class LessonController {

    private final LessonService lessonService;
    private final VocabularyService vocabularyService;
    private final ExerciseService exerciseService;
    private final FileUploadService fileUploadService;

    public LessonController(LessonService lessonService,
                            VocabularyService vocabularyService,
                            ExerciseService exerciseService, FileUploadService fileUploadService) {
        this.lessonService = lessonService;
        this.vocabularyService = vocabularyService;
        this.exerciseService = exerciseService;
        this.fileUploadService = fileUploadService;
    }

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("lessons", lessonService.findAll());
        return "index";
    }

    @GetMapping("/lessons")
    public String lessons(Model model) {
        model.addAttribute("lessons", lessonService.findAll());
        return "lessons";
    }

    @GetMapping("/lesson/{id}")
    public String lessonDetail(@PathVariable Long id, Model model) {
        Lesson lesson = lessonService.findById(id)
                .orElseThrow(() -> new RuntimeException("Leçon non trouvée"));

        model.addAttribute("lesson", lesson);
        return "lesson-detail";
    }

    @GetMapping("/lesson/{id}/vocabulary")
    public String lessonVocabulary(@PathVariable Long id, Model model) {
        Lesson lesson = lessonService.findById(id)
                .orElseThrow(() -> new RuntimeException("Leçon non trouvée"));

        List<Vocabulary> vocab = vocabularyService.findByLessonId(id);

        model.addAttribute("lesson", lesson);
        model.addAttribute("vocabularies", vocab);
        System.out.println("✅ Retour de la vue lesson-vocabulary pour leçon " + id);

        return "lesson-vocabulary";
    }

    @GetMapping("/lesson/{id}/exercises")
    public String lessonExercises(@PathVariable Long id, Model model) {
        Lesson lesson = lessonService.findById(id)
                .orElseThrow(() -> new RuntimeException("Leçon non trouvée"));

        List<Exercise> exercises = exerciseService.findByLessonTitle(lesson.getTitle());

        model.addAttribute("lesson", lesson);
        model.addAttribute("exercises", exercises);
        return "lesson-exercises";
    }

    @GetMapping("/admin/lessons-list")
    public String listLessons(
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            Model model) {

        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());

        Page<Lesson> lessonsPage;

        if (keyword != null && !keyword.trim().isEmpty()) {
            lessonsPage = lessonService.searchLessons(keyword.trim(), pageable);
            model.addAttribute("keyword", keyword); //  garder la valeur dans l'input
        } else {
            lessonsPage = lessonService.findAll(pageable);
        }

        model.addAttribute("lessons", lessonsPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", lessonsPage.getTotalPages());
        model.addAttribute("totalItems", lessonsPage.getTotalElements());

        return "admin/lessons";
    }

    /*#########################################################*/
    @PostMapping("/admin/lessons")
    public String saveLesson(@ModelAttribute Lesson lesson,

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

    @GetMapping("/admin/lessons")
    public String lessons(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            Model model) {

        Pageable pageable = PageRequest.of(page, size);

        Page<Lesson> lessonsPage = lessonService.searchLessons(keyword, pageable);

        model.addAttribute("lessonsPage", lessonsPage);
        model.addAttribute("lessons", lessonsPage.getContent());
        model.addAttribute("keyword", keyword);

        return "admin/lessons-list";
    }

    @GetMapping("/admin/lessons/new")
    public String newLessonForm(Model model) {
        model.addAttribute("lesson", new Lesson());
        return "admin/lesson-form";
    }

    @GetMapping("/admin/lessons/delete/{id}")
    public String deleteLesson(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            lessonService.deleteById(id);
            redirectAttributes.addFlashAttribute("success", "✅ Leçon supprimée avec succès !");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "❌ Impossible de supprimer cette leçon (elle contient peut-être du vocabulaire ou des exercices).");
        }
        return "redirect:/admin/lessons";
    }

    @GetMapping("/admin/lessons/edit/{id}")
    public String editLessonForm(@PathVariable Long id, Model model) {
        Lesson lesson = lessonService.findById(id)
                .orElseThrow(() -> new RuntimeException("Leçon non trouvée"));
        model.addAttribute("lesson", lesson);
        return "admin/lesson-form";
    }


}