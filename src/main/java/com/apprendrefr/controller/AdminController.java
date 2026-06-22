package com.apprendrefr.controller;

import com.apprendrefr.entity.*;
import com.apprendrefr.repository.QuizRepository;
import com.apprendrefr.service.*;
import jakarta.annotation.security.PermitAll;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.io.IOException;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {
@Autowired
   private LessonService lessonService;
@Autowired
   private UserService userService;
@Autowired
  private ExerciseService exerciseService;
@Autowired
private VocabularyService vocabularyService;
@Autowired
    public QuizRepository quizRepository;
    private final FileUploadService fileUploadService;
    @Autowired
    private ImageService imageService;

    public AdminController(LessonService lessonService, UserService userService,
                           ExerciseService exerciseService, VocabularyService vocabularyService,FileUploadService fileUploadService,QuizRepository quizRepository) {
        this.lessonService = lessonService;
        this.userService = userService;
        this.exerciseService = exerciseService;
        this.vocabularyService = vocabularyService;
        this.fileUploadService = fileUploadService;
        this.quizRepository = quizRepository;
    }
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        // 1. Appel des méthodes count() de vos services pour obtenir les chiffres
        long lessons = lessonService.count();
        long users = userService.count();
        long exercises = exerciseService.count();
        long vocabularies = vocabularyService.count();
        long quizzes = quizRepository.count();

        // 2. Passage des variables locales au modèle Thymeleaf
        model.addAttribute("lessonsCount", lessons);
        model.addAttribute("usersCount", users);
        model.addAttribute("exercisesCount", exercises);
        model.addAttribute("vocabularyCount", vocabularies);
        model.addAttribute("quizzesCount", quizzes);

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
    @GetMapping("/user/new")
    public String createForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/new-user-form";
    }
    /// /////////////////////////////
    @PostMapping("/users/save")
    public String saveDsBase(@ModelAttribute User user) {
        userService.save(user);
        return "redirect:/admin/users";
    }

    // Gestion  utilisateurs
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
            e.printStackTrace();  //console
            redirectAttributes.addFlashAttribute("error", "❌ Erreur : " + e.getMessage());
            return "redirect:/admin/vocabulary/new";
        }
    }

    @GetMapping("/vocabulary")
    public String listVocabulary(@RequestParam(value = "keyword", required = false) String keyword,
                                 Model model) {

        if (keyword != null && !keyword.trim().isEmpty()) {
            model.addAttribute("vocabularies",
                    vocabularyService.searchVocabulary(keyword.trim(), Pageable.unpaged()));
            model.addAttribute("keyword", keyword);
        } else {
            model.addAttribute("vocabularies", vocabularyService.findAll());
        }

        return "admin/vocabulary-list";
    }


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
        model.addAttribute("lessons", lessonService.findAll());
        return "admin/exercise-form";
    }

    @PostMapping("/exercises")
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

    @GetMapping("/exercises/edit/{id}")
    public String editExercise(@PathVariable Long id, Model model) {
        Exercise exercise = exerciseService.findById(id)
                .orElseThrow(() -> new RuntimeException("Exercice non trouvé"));
        model.addAttribute("exercise", exercise);
        model.addAttribute("lessons", lessonService.findAll());
        return "admin/exercise-form";
    }

    @GetMapping("/exercises/delete/{id}")
    public String deleteExercise(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            exerciseService.deleteById(id);
            redirectAttributes.addFlashAttribute("success", "✅ Exercice supprimé !");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "❌ Impossible de supprimer cet exercice.");
        }
        return "redirect:/admin/exercises";
    }
    // ==================== QUIZZES ====================
    // LISTE POUR L'ADMIN
    @GetMapping("/quizzes")
    public String listQuizzesForAdmin(Model model) {
        model.addAttribute("quizzes", quizRepository.findAll());
        return "/admin/quizzes-list";
    }

    @GetMapping("/quiz/create")
    public String showCreateQuizForm(Model model) {
        model.addAttribute("quiz", new Quiz());
        return "/admin/quiz-create";
    }

    @PostMapping("/quiz/create")
    public String saveQuiz(@ModelAttribute Quiz quiz, RedirectAttributes redirectAttributes) {
        quizRepository.save(quiz);
        redirectAttributes.addFlashAttribute("success", "✅ Quiz créé !");
        return "redirect:/admin/quizzes";
    }

    @GetMapping("/quiz/edit/{id}")
    public String showEditQuizForm(@PathVariable Long id, Model model) {
        Optional<Quiz> opt = quizRepository.findById(id);
        if (opt.isPresent()) {
            model.addAttribute("quiz", opt.get());
            return "admin/quiz-edit";
        }
        return "redirect:/admin/quizzes";
    }

    @PostMapping("/quiz/edit/{id}")
    public String updateQuiz(@PathVariable Long id, @ModelAttribute Quiz quiz) {
        quiz.setId(id);
        quizRepository.save(quiz);
        return "redirect:/admin/quizzes";
    }

    @GetMapping("/quiz/delete/{id}")
    public String deleteQuiz(@PathVariable Long id) {
        quizRepository.deleteById(id);
        return "redirect:/admin/quizzes";
    }
    @GetMapping("/quiz/new")
    public String showCreateQuizForm1(Model model) {
        model.addAttribute("quiz", new Quiz());
        return "admin/quiz-create"; // Affiche le formulaire
    }
/// ////////////////////////////////////////////////////////////////
@GetMapping("/images/optimize")
@PermitAll
@PreAuthorize("hasRole('ADMIN')")
@ResponseBody
public String launchImageOptimization() {

    String path = "uploads/images";
    imageService.batchProcessImages(path);
    return "Optimisation lancée sur le dossier : " + path;
}
/// //////////////////////////////////PRONONCIATION//////////////

    @GetMapping("/preparation/new")
    public String showCreatePreparationForm(Exercise exercise,Quiz quiz, Model model) {
        model.addAttribute("quiz", new Quiz());
        model.addAttribute("exercise", exercise);

        return "admin/preparation-form-create";
    }

}