package com.apprendrefr.controller;

import com.apprendrefr.entity.Prononciation;
import com.apprendrefr.service.FileUploadService;
import com.apprendrefr.service.PrononciationService;
import com.apprendrefr.util.AdminPaging;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class PrononciationController {

    private final PrononciationService service;
    private final FileUploadService fileUploadService;

    public PrononciationController(PrononciationService service, FileUploadService fileUploadService) {
        this.service = service;
        this.fileUploadService = fileUploadService;
    }

    @GetMapping("/prononciation")
    public String afficher(Model model) {

        model.addAttribute("prononciations", service.findAll());

        return "prononciation";
    }

    @GetMapping("/admin/prononciationsDashboard")
    public String prononciationliste(@RequestParam(defaultValue = "0") int page,
                                     @RequestParam(defaultValue = "10") int size,
                                     Model model) {

        Pageable pageable = AdminPaging.newestFirst(page, size);
        Page<Prononciation> prononciationsPage = service.findAllPaginated(pageable);

        model.addAttribute("prononciationsPage", prononciationsPage);
        model.addAttribute("prononciations", prononciationsPage.getContent());

        return "admin/prononciation-list";
    }

    @GetMapping("/admin/prononciation/ajouter")
    public String afficherFormulaire(Model model) {
        model.addAttribute("prononciation", new com.apprendrefr.entity.Prononciation());
        model.addAttribute("titre", "Ajouter une prononciation");

        return "admin/prononciation-form-create";

    }

    @GetMapping("/admin/prononciation/modifier/{id}")
    public String afficherPrononciationModification(@PathVariable Long id, Model model) {
        com.apprendrefr.entity.Prononciation prononciation = service.findById(id);

        model.addAttribute("prononciation", prononciation);
        model.addAttribute("titre", "Modifier une prononciation");

        return "admin/prononciation-form-create";

    }

    @PostMapping("/admin/prononciation/enregistrer")
    public String enregistrer(@ModelAttribute Prononciation prononciation,
                              @RequestParam(value = "audioFile", required = false) MultipartFile audioFile) {

        // Le service ne garde que les formats audio autorisés et donne un nom aléatoire au fichier
        String audioPath = fileUploadService.saveAudio(audioFile);
        if (audioPath != null) {
            prononciation.setAudio(audioPath);
        }

        service.save(prononciation);
        return "redirect:/admin/prononciationsDashboard";
    }

    @PostMapping("/admin/prononciation/supprimer/{id}")
    public String supprimer(@PathVariable Long id) {

        service.deleteById(id);

        return "redirect:/prononciation";
    }
}