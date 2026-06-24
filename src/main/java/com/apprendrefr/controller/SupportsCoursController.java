package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class SupportsCoursController {

    @GetMapping("/supports-de-cours")
    public String allerSupportCours(){
        return "supports-de-cours";

    }

    @GetMapping("/adjectif")
    public String allerSurAdjectif(){
        return "adjectif";

    }
    @GetMapping("/pronoms")
    public String allerSurPronoms(){
        return "pronoms";

    }
    @GetMapping("/imperatif")
    public String allerSurImperatif(){
        return "impératif";

    }
    @GetMapping("/passecompse")
    public String allerSurPassecompse(){
        return "le_passé_composé";

    }
    @GetMapping("/adjectifsdemonstratifs")
    public String allerSurAdjectifsDemonstratifs(){
        return "adjectifs-demonstratifs";

    }
    @GetMapping("/expressionstemps")
    public String allerSurExpressionsTemps(){
        return "expressions-temps";

    }
    @GetMapping("/futursimple")
    public String allerSurFutureSimple(){
        return "futur-simple";

    }
    @GetMapping("/verbesreguliers")
    public String allerSurVerbesReguliers(){
        return "verbes-reguliers";

    }
    @GetMapping("/auxiliaires")
    public String allerSurAuxiliaires(){
        return "auxiliaires";
    }
    /// /////////////////
    @GetMapping("/coursGrammaireA1")
    public String allerSurCoursGrammaire(){
        return "cours-grammaire-A1";
    }
    @GetMapping("/articlesDéfinis")
    public String allerSurArticleDefinis(){
        return "articles-definis.html";
    }
    @GetMapping("/genreEtNombreDesNoms")
    public String allerSurGenreEtNombre(){
        return "genre-et-nombre-des-noms.html";
    }
    @GetMapping("/adjectifsQualificatifs")
    public String allerSurAdjectifsQualificatifs(){
        return "adjectifs-qualificatifs.html";
    }
    @GetMapping("/PronomsPersonnelsSujets")
    public String allerSurPronomsPersonnelSujets(){
        return "pronoms-personnels-sujets.html";
    }
    @GetMapping("/verbesAuPresent")
    public String allerSurVerbesAuxPresent(){
        return "verbes-au-present.html";
    }
    @GetMapping("/NegationSimple")
    public String allerSurNegationSimple(){
        return "negation-simple.html";
    }
    @GetMapping("/questionsSimples")
    public String allerSurQuestionsSimple(){
        return "questions-simples.html";
    }
    @GetMapping("/PropositionsDeLieuEtTemps")
    public String allerSurPropositionsLieuTemps(){
        return "propositions-de-lieu-et-de-temps.html";
    }
    @GetMapping("/pronomsPossessifsEtDemonstratifs")
    public String allerSurPronomsPossessifsEtDemonstratifs(){
        return "pronoms-possessifs-et-demonstratifs.html";
    }

}
