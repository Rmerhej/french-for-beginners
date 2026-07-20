package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StaticPagesController {
    @GetMapping("/chiffresEtLettres")
    public String goToChiffresEtLettres() {
        return "chiffresEtLettres";
    }

    @GetMapping("/cultureFrancaise")
    public String culture() {
        return "cultureFrancaise";
    }

    @GetMapping("/fetesFrancaise")
    public String goToFetesFrancaise() {
        return "fetesfrancise";
    }

    @GetMapping("/politesse")
    public String goToPolitesse() {
        return "politesse";
    }

    @GetMapping("/lesRegions")
    public String goToLesRegions() {
        return "lesregions";
    }

    @GetMapping("/lesTransports")
    public String goToLesTransports() {
        return "lestransports";
    }

    @GetMapping("/lesRepas")
    public String goToLesRepas() {
        return "lesrepas";
    }

    @GetMapping("/supports-de-cours")
    public String allerSupportCours() {return "supports-de-cours";}

    @GetMapping("/adjectif")
    public String allerSurAdjectif() {return "adjectif";}

    @GetMapping("/pronoms")
    public String allerSurPronoms() {return "pronoms";}

    @GetMapping("/imperatif")
    public String allerSurImperatif() {return "impératif";}

    @GetMapping("/passecompse")
    public String allerSurPassecompse() {return "le_passé_composé";}

    @GetMapping("/adjectifsdemonstratifs")
    public String allerSurAdjectifsDemonstratifs() {return "adjectifs-demonstratifs";}

    @GetMapping("/expressionstemps")
    public String allerSurExpressionsTemps() {return "expressions-temps";}

    @GetMapping("/futursimple")
    public String allerSurFutureSimple() {return "futur-simple";}

    @GetMapping("/verbesreguliers")
    public String allerSurVerbesReguliers() {return "verbes-reguliers";
    }
    @GetMapping("/conjugaison")
    public String allerSurConjugaison() {return "conjugaison";}

    @GetMapping("/auxiliaires")
    public String allerSurAuxiliaires() {
        return "auxiliaires";
    }

    @GetMapping("/articlesDéfinis")
    public String allerSurArticleDefinis() {
        return "articles-definis";
    }

    @GetMapping("/genreEtNombreDesNoms")
    public String allerSurGenreEtNombre() {
        return "genre-et-nombre-des-noms";
    }

    @GetMapping("/adjectifsQualificatifs")
    public String allerSurAdjectifsQualificatifs() {
        return "adjectifs-qualificatifs";
    }

    @GetMapping("/PronomsPersonnelsSujets")
    public String allerSurPronomsPersonnelSujets() {
        return "pronoms-personnels-sujets";
    }

    @GetMapping("/verbesAuPresent")
    public String allerSurVerbesAuxPresent() {
        return "verbes-au-present";
    }

    @GetMapping("/NegationSimple")
    public String allerSurNegationSimple() {
        return "negation-simple";
    }

    @GetMapping("/questionsSimples")
    public String allerSurQuestionsSimple() {
        return "questions-simples";
    }

    @GetMapping("/PrepositionsDeLieuEtTemps")
    public String allerSurPrepositionsLieuTemps() {
        return "propositions-de-lieu-et-de-temps";
    }

    @GetMapping("/pronomsPossessifsEtDemonstratifs")
    public String allerSurPronomsPossessifsEtDemonstratifs() {
        return "pronoms-possessifs-et-demonstratifs";
    }

    @GetMapping("/lesVerbes")
    public String verbes() {
        return "verbes";
    }
}
