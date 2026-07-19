package com.apprendrefr.controller;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.service.FileUploadService;
import com.apprendrefr.service.ImageService;
import com.apprendrefr.service.LessonService;
import com.apprendrefr.service.VocabularyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class VocabularyController {
    @Autowired
    private LessonService lessonService;
    @Autowired
    private VocabularyService vocabularyService;
    private final FileUploadService fileUploadService;
    @Autowired
    private ImageService imageService;


    public VocabularyController(LessonService lessonService, VocabularyService vocabularyService, FileUploadService fileUploadService) {
        this.lessonService = lessonService;
        this.vocabularyService = vocabularyService;
        this.fileUploadService = fileUploadService;

    }


    @PostMapping("/admin/vocabulary")

    public String saveVocabulary(@ModelAttribute Vocabulary vocabularyForm,
                                 @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                 @RequestParam(value = "audioFile", required = false) MultipartFile audioFile,
                                 RedirectAttributes redirectAttributes) {

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

    @GetMapping("/admin/vocabulary")
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


    @GetMapping("/admin/vocabulary/new")
    public String newVocabularyForm(Model model) {
        model.addAttribute("vocabulary", new Vocabulary());
        model.addAttribute("lessons", lessonService.findAll());   // Pour le select des leçons
        return "admin/vocabulary-form";
    }

    @GetMapping("/admin/vocabulary/edit/{id}")
    public String editVocabularyForm(@PathVariable Long id, Model model) {
        Vocabulary vocab = vocabularyService.findById(id)
                .orElseThrow(() -> new RuntimeException("Mot non trouvé"));
        model.addAttribute("vocabulary", vocab);
        model.addAttribute("lessons", lessonService.findAll());
        return "admin/vocabulary-form";
    }


    @GetMapping("/admin/vocabulary/delete/{id}")
    public String deleteVocabulary(@PathVariable Long id) {
        vocabularyService.deleteById(id);
        return "redirect:/admin/vocabulary";
    }

}
