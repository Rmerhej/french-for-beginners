package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.LessonService;
import com.apprendrefr.service.VocabularyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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

        System.out.println("✅ Retour de la vue lesson-vocabulary pour leçon " + id);

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

}