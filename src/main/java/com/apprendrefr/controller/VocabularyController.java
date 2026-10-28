package com.apprendrefr.controller;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.exception.ResourceNotFoundException;
import com.apprendrefr.service.FileUploadService;
import com.apprendrefr.service.LessonService;
import com.apprendrefr.service.VocabularyService;
import com.apprendrefr.util.AdminPaging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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

            Vocabulary vocabularyToSave;

            if (vocabularyForm.getId() != null) {

                vocabularyToSave = vocabularyService.findById(vocabularyForm.getId())
                        .orElseThrow(() -> new ResourceNotFoundException("Mot de vocabulaire introuvable pour l'id : " + vocabularyForm.getId()));


                vocabularyToSave.setFrenchWord(vocabularyForm.getFrenchWord());
                vocabularyToSave.setEnglishTranslation(vocabularyForm.getEnglishTranslation());
                vocabularyToSave.setPronunciation(vocabularyForm.getPronunciation());
                vocabularyToSave.setExampleSentence(vocabularyForm.getExampleSentence());
                vocabularyToSave.setAltText(vocabularyForm.getAltText());
            } else {
                vocabularyToSave = vocabularyForm;
            }


            if (vocabularyForm.getLessonId() == null) {
                redirectAttributes.addFlashAttribute("error", "❌ Veuillez sélectionner une leçon.");
                return "redirect:/admin/vocabulary/new";
            }
            Lesson lesson = lessonService.findById(vocabularyForm.getLessonId())
                    .orElseThrow(() -> new ResourceNotFoundException("Leçon introuvable"));
            vocabularyToSave.setLesson(lesson);
            vocabularyToSave.setLessonId(vocabularyForm.getLessonId());

            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = fileUploadService.saveImage(imageFile);
                vocabularyToSave.setImageUrl(imageUrl);
            }


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

            return vocabularyForm.getId() != null ?
                    "redirect:/admin/vocabulary/edit/" + vocabularyForm.getId() :
                    "redirect:/admin/vocabulary/new";
        }
    }

    @GetMapping("/admin/vocabulary")
    public String listVocabulary(@RequestParam(defaultValue = "0") int page,
                                 @RequestParam(defaultValue = "10") int size,
                                 @RequestParam(required = false) String keyword,
                                 Model model) {

        Pageable pageable = AdminPaging.newestFirst(page, size);

        Page<Vocabulary> vocabularyPage = vocabularyService.searchVocabulary(keyword, pageable);

        model.addAttribute("vocabularyPage", vocabularyPage);
        model.addAttribute("vocabularies", vocabularyPage.getContent());
        model.addAttribute("keyword", keyword);

        return "admin/vocabulary-list";
    }


    @GetMapping("/admin/vocabulary/new")
    public String newVocabularyForm(Model model) {
        model.addAttribute("vocabulary", new Vocabulary());
        model.addAttribute("lessons", lessonService.findAll());
        return "admin/vocabulary-form";
    }

    @GetMapping("/admin/vocabulary/edit/{id}")
    public String editVocabularyForm(@PathVariable Long id, Model model) {
        Vocabulary vocab = vocabularyService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Mot non trouvé"));
        model.addAttribute("vocabulary", vocab);
        model.addAttribute("lessons", lessonService.findAll());
        return "admin/vocabulary-form";
    }


    @PostMapping("/admin/vocabulary/delete/{id}")
    public String deleteVocabulary(@PathVariable Long id) {
        vocabularyService.deleteById(id);
        return "redirect:/admin/vocabulary";
    }


}
