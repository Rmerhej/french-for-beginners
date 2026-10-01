package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Quiz;
import com.apprendrefr.service.ExerciseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PreparationController {

    @Autowired
    private ExerciseService exerciseService;

    @GetMapping("/preparation-list-index")
    public String redirectFromIndex() {
        return "preparation-list";
    }

    @GetMapping("/lessons/preparation-list")
    public String getAuBureauPage(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Au Bureau");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "preparation-list";
    }

    @GetMapping("/admin/preparation/new")
    public String showCreatePreparationForm(Exercise exercise, Quiz quiz, Model model) {
        model.addAttribute("quiz", new Quiz());
        model.addAttribute("exercise", exercise);

        return "admin/preparation-form-create";
    }

    @GetMapping("/togoToAuBureu")
    public String redirectFromPreparationList(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Au Bureau");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "au-bureau";
    }
    @GetMapping("/AuCafé")
    public String allerAuCAfé(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("U Sartrouville");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "Au-café";
    }
    @GetMapping("/AuTéléphone")
    public String allerAuTéléphone(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Au Téléphone");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "Au-téléphone";
    }

    @GetMapping("/LaVieQuotidienne")
    public String allerAlaVieQuotidienne(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("La vie quotidienne");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "LaVieQuotidienne.html";
    }
    @GetMapping("/LeTourisme")
    public String allerAleTourisme(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Le tourisme");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "LeTourisme.html";
    }
    @GetMapping("/LesRenseignements")
    public String allerAlesRenseignements(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Les renseignements");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "LesRenseignements.html";
    }

    @GetMapping("/AutourDeBébé")
    public String allerAautourdeBebe(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Autour de Bébé");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "AutourDeBébé.html";
    }

    @GetMapping("/laSanté")
    public String allerAlaSante(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("La santé");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "laSanté.html";
    }
    @GetMapping("/LesRelationsHumaines")
    public String allerLesRelationsHumaines(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Les relations humaines");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "LesRelationsHumaines.html";
    }

    @GetMapping("/LesTâchesDomestiques")
    public String aller(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Les tâches domestiques");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "LesTâchesDomestiques.html";
    }



    @GetMapping("/lesgens")
    public String allerLesGens(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Les gens");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "les-gens";
    }

    @GetMapping("/lesport")
    public String allerLeSport(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Le sport");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "le-sport";
    }

    @GetMapping("/entreprise")
    public String allerAEntreprise(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Entreprise");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "entreprise-qcm";
    }

    @GetMapping("/bricolage")
    public String allerABricolage(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Le bricolage");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "le-bricolage";
    }
    @GetMapping("/ville")
    public String allerAVille(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("La ville");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "la-ville";
    }
    @GetMapping("/laFac")
    public String allerLaFac(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("La fac");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "la-fac";
    }
    @GetMapping("/meteo")
    public String allerAmeteo(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("La météo");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "la-meteo";
    }
}