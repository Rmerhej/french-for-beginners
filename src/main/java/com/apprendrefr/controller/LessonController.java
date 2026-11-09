package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.exception.ResourceNotFoundException;
import com.apprendrefr.service.ExerciseService;
import com.apprendrefr.service.FileUploadService;
import com.apprendrefr.repository.UserRepository;
import com.apprendrefr.service.LessonService;
import com.apprendrefr.service.ParcoursService;
import com.apprendrefr.entity.Translation;
import com.apprendrefr.service.TranslationService;
import com.apprendrefr.service.VocabularyService;
import com.apprendrefr.util.TranslationLang;
import jakarta.servlet.http.HttpServletResponse;
import com.apprendrefr.util.AdminPaging;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    private final ParcoursService parcoursService;
    private final UserRepository userRepository;
    private final TranslationService translationService;

    public LessonController(LessonService lessonService,
                            VocabularyService vocabularyService,
                            ExerciseService exerciseService, FileUploadService fileUploadService,
                            ParcoursService parcoursService, UserRepository userRepository,
                            TranslationService translationService) {
        this.translationService = translationService;
        this.lessonService = lessonService;
        this.vocabularyService = vocabularyService;
        this.exerciseService = exerciseService;
        this.fileUploadService = fileUploadService;
        this.parcoursService = parcoursService;
        this.userRepository = userRepository;
    }

    @GetMapping("/")
    public String home(Model model, java.security.Principal principal) {
        model.addAttribute("lessons", lessonService.findAll());
        if (principal != null) {
            String niveauTest = userRepository.findByUsername(principal.getName())
                    .map(com.apprendrefr.entity.User::getPlacementLevel).orElse(null);
            model.addAttribute("suivi", parcoursService.suivi(principal.getName(), niveauTest));
        }
        return "index";
    }

    @GetMapping("/niveauDebutant")
    public String niveauDebutant(Model model) {
        List<Lesson> lessonsList = lessonService.findAll();

        model.addAttribute("lessons", lessonsList);

        return "niveauDebutant";
    }

    @GetMapping("/niveauConsolidation")
    public String niveauConsolidation(Model model) {
        return "niveauConsolidation";
    }

    @GetMapping("/niveauApprofondissement")
    public String niveauApprofondissement(Model model) {
        return "niveauApprofondissement";
    }

    @GetMapping("/lessons")
    public String lessons(Model model) {
        model.addAttribute("lessons", lessonService.findAll());
        return "lessons";
    }

    @GetMapping("/lesson/{id}")
    public String lessonDetail(@PathVariable Long id, Model model) {
        Lesson lesson = lessonService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Leçon non trouvée"));

        model.addAttribute("lesson", lesson);
        return "lesson-detail";
    }

    @GetMapping("/lesson/{id}/vocabulary")
    public String lessonVocabulary(@PathVariable Long id,
                                   @RequestParam(name = "lang", required = false) String lang,
                                   @CookieValue(name = TranslationService.COOKIE, required = false) String langCookie,
                                   HttpServletResponse response,
                                   Model model) {
        Lesson lesson = lessonService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Leçon non trouvée"));

        List<Vocabulary> vocab = vocabularyService.findByLessonId(id);

        model.addAttribute("lesson", lesson);
        model.addAttribute("vocabularies", vocab);

        // Traductions des mots et des phrases d'exemple (langue choisie, mémorisée dans un cookie)
        TranslationLang chosen = translationService.resolve(lang, langCookie, response).orElse(null);
        model.addAttribute("langs", TranslationLang.all());
        model.addAttribute("currentLang", chosen);
        model.addAttribute("langBase", "/lesson/" + id + "/vocabulary");
        java.util.Map<Long, String> wordTr = new java.util.HashMap<>();
        java.util.Map<Long, String> sentenceTr = new java.util.HashMap<>();
        if (chosen != null) {
            java.util.List<Long> ids = vocab.stream().map(Vocabulary::getId).toList();
            wordTr = translationService.contents(Translation.VOCAB_WORD, ids, chosen);
            sentenceTr = translationService.contents(Translation.VOCAB_SENTENCE, ids, chosen);
        }
        model.addAttribute("wordTr", wordTr);
        model.addAttribute("sentenceTr", sentenceTr);

        return "lesson-vocabulary";
    }

    @GetMapping("/lesson/{id}/exercises")
    public String lessonExercises(@PathVariable Long id, Model model) {
        Lesson lesson = lessonService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Leçon non trouvée"));

        List<Exercise> exercises = exerciseService.findByLessonTitle(lesson.getTitle());

        model.addAttribute("lesson", lesson);
        model.addAttribute("exercises", exercises);
        return "lesson-exercises";
    }

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

    @GetMapping("/admin/lessons")
    public String lessons(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            Model model) {

        Pageable pageable = AdminPaging.newestFirst(page, size);

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

    @PostMapping("/admin/lessons/delete/{id}")
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
                .orElseThrow(() -> new ResourceNotFoundException("Leçon non trouvée"));
        model.addAttribute("lesson", lesson);
        return "admin/lesson-form";
    }


}