package com.apprendrefr.controller;

import com.apprendrefr.entity.Prononciation;
import com.apprendrefr.service.PrononciationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Controller
public class PrononciationController {

    private final PrononciationService service;
    private final String AUDIO_UPLOAD_DIR = "uploads/audio/";

    public PrononciationController(PrononciationService service) {
        this.service = service;
    }

    @GetMapping("/prononciation")
    public String afficher(Model model) {

        model.addAttribute("prononciations", service.findAll());

        return "prononciation";
    }

    @GetMapping("/admin/prononciationsDashboard")
    public String prononciationliste(Model model) {

        model.addAttribute("prononciations", service.findAll());

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
                              @RequestParam(value = "audioFile", required = false) MultipartFile audioFile) throws IOException {

        if (audioFile != null && !audioFile.isEmpty()) {

            String originalName = Paths.get(audioFile.getOriginalFilename())
                    .getFileName()
                    .toString();

            String fileName = UUID.randomUUID() + "_" + originalName;

            Path uploadPath = Paths.get(AUDIO_UPLOAD_DIR);

            Files.createDirectories(uploadPath);

            Files.copy(
                    audioFile.getInputStream(),
                    uploadPath.resolve(fileName),
                    StandardCopyOption.REPLACE_EXISTING
            );

            // chemin enregistré en base
            prononciation.setAudio("/uploads/audio/" + fileName);
        }

        service.save(prononciation);
        return "redirect:/admin/prononciationsDashboard";

    }

    @GetMapping("/admin/prononciation/supprimer/{id}")
    public String supprimer(@PathVariable Long id) {

        service.deleteById(id);

        return "redirect:/prononciation";
    }
}