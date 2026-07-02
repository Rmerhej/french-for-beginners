package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.User;
import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.LessonService;
import com.apprendrefr.service.UserService;
import com.apprendrefr.service.VocabularyService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LessonController {

    private final LessonService lessonService;
    private final VocabularyService vocabularyService;
    private final ExerciseService exerciseService;

    public LessonController(LessonService lessonService,
                            VocabularyService vocabularyService,
                            ExerciseService exerciseService) {
        this.lessonService = lessonService;
        this.vocabularyService = vocabularyService;
        this.exerciseService = exerciseService;
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
        System.out.println("✅ Retour de la vue lesson-vocabulary pour leçon " + id );

        return "lesson-vocabulary";   // Important : sans .html
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

        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending()); // ou l'ordre que tu veux

        Page<Lesson> lessonsPage;

        if (keyword != null && !keyword.trim().isEmpty()) {
            lessonsPage = lessonService.searchLessons(keyword.trim(), pageable);
            model.addAttribute("keyword", keyword); // pour garder la valeur dans l'input
        } else {
            lessonsPage = lessonService.findAll(pageable); // ta méthode classique sans recherche
        }

        model.addAttribute("lessons", lessonsPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", lessonsPage.getTotalPages());
        model.addAttribute("totalItems", lessonsPage.getTotalElements());

        return "admin/lessons"; // ton template
    }

}