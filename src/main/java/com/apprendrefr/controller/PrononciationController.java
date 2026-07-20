package com.apprendrefr.controller;

import com.apprendrefr.service.PrononciationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PrononciationController {

    private final PrononciationService service;

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
        model.addAttribute("prononciation", new com.apprendrefr.model.Prononciation());
        model.addAttribute("titre", "Ajouter une prononciation");

        return "admin/prononciation-form-create";

    }

    @GetMapping("/admin/prononciation/modifier/{id}")
    public String afficherPrononciationModification(@PathVariable Long id, Model model) {
        com.apprendrefr.model.Prononciation prononciation = service.findById(id);

        model.addAttribute("prononciation", prononciation);
        model.addAttribute("titre", "Modifier une prononciation");

        return "admin/prononciation-form-create";

    }

    @PostMapping("/admin/prononciation/enregistrer")
    public String enregistrer(@ModelAttribute com.apprendrefr.model.Prononciation prononciation) {

        service.save(prononciation);

        return "redirect:/prononciation";

    }

    @GetMapping("/admin/prononciation/supprimer/{id}")
    public String supprimer(@PathVariable Long id) {

        service.deleteById(id);

        return "redirect:/prononciation";
    }
}