package com.apprendrefr.controller;

import com.apprendrefr.entity.*;
import com.apprendrefr.service.*;
import jakarta.annotation.security.PermitAll;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    private final FileUploadService fileUploadService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private ThemeService themeService;
    @Autowired
    private QuizService quizService;
    @Autowired
    private PrononciationService prononciationService;

    public AdminController(LessonService lessonService, UserService userService, QuizService quizService,
                           PrononciationService prononciationService, ExerciseService exerciseService, VocabularyService vocabularyService, ThemeService themeService, FileUploadService fileUploadService) {
        this.lessonService = lessonService;
        this.userService = userService;
        this.exerciseService = exerciseService;
        this.vocabularyService = vocabularyService;
        this.fileUploadService = fileUploadService;
        this.themeService = themeService;
        this.quizService = quizService;
        this.prononciationService = prononciationService;
    }

    @GetMapping
    public String adminHome() {
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        //  Appel des méthodes count() des services pour obtenir les chiffres
        long lessons = lessonService.count();
        long users = userService.count();
        long exercises = exerciseService.count();
        long vocabularies = vocabularyService.count();
        long quizzes = quizService.count();
        long themes = themeService.count();
        long prononciations = prononciationService.count();

        //  Passage des variables locales au modèle Thymeleaf
        model.addAttribute("lessonsCount", lessons);
        model.addAttribute("usersCount", users);
        model.addAttribute("exercisesCount", exercises);
        model.addAttribute("vocabularyCount", vocabularies);
        model.addAttribute("quizzesCount", quizzes);
        model.addAttribute("themesCount", themes);
        model.addAttribute("prononciationsCount", prononciations);
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

    @PostMapping("/users/save")
    public String saveDsBase(@ModelAttribute User user) {
        userService.save(user);
        return "redirect:/admin/users";
    }

    // ==================  utilisateurs =======================
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

    @GetMapping("/lessons")
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

    @GetMapping("/lessons/new")
    public String newLessonForm(Model model) {
        model.addAttribute("lesson", new Lesson());
        return "admin/lesson-form";
    }

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
    public String saveVocabulary(@ModelAttribute Vocabulary vocabularyForm,
                                 @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                 @RequestParam(value = "audioFile", required = false) MultipartFile audioFile,
                                 RedirectAttributes redirectAttributes) {
        System.out.println("--- DIAGNOSTIC UPLOAD ---");
        System.out.println("Fichier Image reçu : " + (imageFile != null ? imageFile.getOriginalFilename() : "NULL"));
        System.out.println("Fichier Audio reçu : " + (audioFile != null ? audioFile.getOriginalFilename() : "NULL"));
        try {
            // 1. Déterminer si c'est une création ou une modification
            Vocabulary vocabularyToSave;

            if (vocabularyForm.getId() != null) {
                //  chargement de l'existant complet de la BDD
                vocabularyToSave = vocabularyService.findById(vocabularyForm.getId())
                        .orElseThrow(() -> new RuntimeException("Mot de vocabulaire introuvable pour l'id : " + vocabularyForm.getId()));

                //  mise à jour des données textuelles venues du formulaire
                vocabularyToSave.setFrenchWord(vocabularyForm.getFrenchWord());
                vocabularyToSave.setEnglishTranslation(vocabularyForm.getEnglishTranslation());
                // Ajout des autres champs de texte
                vocabularyToSave.setPronunciation(vocabularyForm.getPronunciation());
                vocabularyToSave.setExampleSentence(vocabularyForm.getExampleSentence());
                vocabularyToSave.setAltText(vocabularyForm.getAltText());
            } else {
                // CRÉATION : nouveau mot
                vocabularyToSave = vocabularyForm;
            }

            // 2. Gestion de la leçon (Commune création / modification)
            if (vocabularyForm.getLessonId() == null) {
                redirectAttributes.addFlashAttribute("error", "❌ Veuillez sélectionner une leçon.");
                return "redirect:/admin/vocabulary/new";
            }
            Lesson lesson = lessonService.findById(vocabularyForm.getLessonId())
                    .orElseThrow(() -> new RuntimeException("Leçon introuvable"));
            vocabularyToSave.setLesson(lesson);
            vocabularyToSave.setLessonId(vocabularyForm.getLessonId());

            // 3. Gestion de l'Image (écrasement  SI un nouveau fichier est fourni)
            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = fileUploadService.saveImage(imageFile);
                vocabularyToSave.setImageUrl(imageUrl);
            }

            // 4. Gestion de l'Audio (écrase que si un nouveau fichier est fourni)
            if (audioFile != null && !audioFile.isEmpty()) {
                String audioUrl = fileUploadService.saveAudio(audioFile);
                vocabularyToSave.setAudioUrl(audioUrl);
            }

            vocabularyService.save(vocabularyToSave);

            redirectAttributes.addFlashAttribute("success", "✅ Mot enregistré avec succès !");
            return "redirect:/admin/vocabulary";

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "❌ Erreur : " + e.getMessage());
            // En cas d'erreur, on redirige
            return vocabularyForm.getId() != null ?
                    "redirect:/admin/vocabulary/edit/" + vocabularyForm.getId() :
                    "redirect:/admin/vocabulary/new";
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

    @GetMapping("/quizzes")
    public String quizzes(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            Model model) {

        Pageable pageable = PageRequest.of(page, size);

        Page<Quiz> quizzesPage = quizService.searchQuizzes(keyword, pageable);

        model.addAttribute("quizzesPage", quizzesPage);
        model.addAttribute("quizzes", quizzesPage.getContent());
        model.addAttribute("keyword", keyword);

        return "admin/quizzes-list";
    }

    /*############################*/
    @GetMapping("/quiz/create")
    public String showCreateQuizForm(Model model) {
        model.addAttribute("quiz", new Quiz());
        return "/admin/quiz-create";
    }

    @PostMapping("/quiz/create")
    public String saveQuiz(@ModelAttribute Quiz quiz, RedirectAttributes redirectAttributes) {
        quizService.save(quiz);
        redirectAttributes.addFlashAttribute("success", "✅ Quiz créé !");
        return "redirect:/admin/quizzes";
    }

    @GetMapping("/quiz/edit/{id}")
    public String showEditQuizForm(@PathVariable Long id, Model model) {
        Optional<Quiz> opt = quizService.findById(id);
        if (opt.isPresent()) {
            model.addAttribute("quiz", opt.get());
            return "admin/quiz-edit";
        }
        return "redirect:/admin/quizzes";
    }

    @PostMapping("/quiz/edit/{id}")
    public String updateQuiz(@PathVariable Long id, @ModelAttribute Quiz quiz) {
        quiz.setId(id);
        quizService.save(quiz);
        return "redirect:/admin/quizzes";
    }

    @GetMapping("/quiz/delete/{id}")
    public String deleteQuiz(@PathVariable Long id) {
        quizService.deleteById(id);
        return "redirect:/admin/quizzes";
    }

    @GetMapping("/quiz/new")
    public String showCreateQuizForm1(Model model) {
        model.addAttribute("quiz", new Quiz());
        return "admin/quiz-create"; // Affiche le formulaire
    }

    //##############################  Themes  #############################//

    @GetMapping("/themes")
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

        return "admin/themes-list";
    }

    @GetMapping("/theme/new")
    public String showCreateThemeForm(Model model) {
        model.addAttribute("theme", new Theme());

        return "admin/theme-form-create";
    }

    @PostMapping("/theme/new")
    public String createTheme(@ModelAttribute Theme theme) {
        themeService.save(theme);
        return "redirect:/themes";
    }

    @GetMapping("/theme/edit/{id}")
    public String showEditThemeForm(@PathVariable Long id, Model model) {
        Optional<Theme> opt = themeService.findById(id);
        if (opt.isPresent()) {
            model.addAttribute("theme", opt.get());
            return "admin/theme-edit";

        }
        return "redirect:/admin/themes";
    }

    @PostMapping("/theme/edit/{id}")
    public String updateTheme(@PathVariable Long id, @ModelAttribute Theme theme) {
        theme.setId(id);
        themeService.save(theme);
        return "redirect:/admin/themes";
    }

    @GetMapping("/theme/delete/{id}")
    public String deleteTheme(@PathVariable Long id) {
        themeService.deleteById(id);
        return "redirect:/admin/themes";
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
    public String showCreatePreparationForm(Exercise exercise, Quiz quiz, Model model) {
        model.addAttribute("quiz", new Quiz());
        model.addAttribute("exercise", exercise);

        return "admin/preparation-form-create";
    }
    /*########################Prononciation############################*/

    @GetMapping("/prononciationsDashboard")
    public String prononciationliste(Model model) {

        model.addAttribute("prononciations", prononciationService.findAll());

        return "admin/prononciation-list";
    }

    @GetMapping("/prononciation/ajouter")
    public String afficherFormulaire(Model model) {
        model.addAttribute("prononciation", new com.apprendrefr.model.Prononciation());
        model.addAttribute("titre", "Ajouter une prononciation");

        return "admin/prononciation-form-create";

    }
   /* @PostMapping("/prononciation/ajouter")
    public String enregistrer(
            @ModelAttribute com.apprendrefr.model.Prononciation prononciation) {

        prononciationService.save(prononciation);

        return "redirect:/prononciation";

    }*/

    @GetMapping("/prononciation/modifier/{id}")
    public String afficherPrononciationModification(
            @PathVariable Long id,
            Model model) {
        com.apprendrefr.model.Prononciation prononciation =
                prononciationService.findById(id);


        model.addAttribute("prononciation", prononciation);
        model.addAttribute("titre", "Ajouter une prononciation");

        return "admin/prononciation-form-create";

    }

    @PostMapping("/prononciation/enregistrer")
    public String enregistrer(@ModelAttribute com.apprendrefr.model.Prononciation prononciation) {

        prononciationService.save(prononciation);

        return "redirect:/prononciation";

    }

    @GetMapping("/prononciation/supprimer/{id}")
    public String supprimer(@PathVariable Long id) {

        prononciationService.deleteById(id);

        return "redirect:/prononciation";
    }
}