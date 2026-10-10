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

    @GetMapping("/verbesreguliers")
    public String allerSurVerbesReguliers() {return "verbes-reguliers";
    }

    @GetMapping("/lesNomsMasculinetFeminin")
    public String allerSurlesNomsMasculinetFeminin() {return "lesNomsMasculinetFeminin";
    }
    @GetMapping("/lesPrépositions")
    public String allerSurlesPrepositions() {return "lesPrépositions";
    }
    @GetMapping("/présentdesVerbesEner")
    public String allerSurpresentdesVerbesEner() {return "présentdesVerbesEner";
    }

    @GetMapping("/allerEtFaire")
    public String allerSurallerEtFaire() {return "allerEtFaire";
    }

    @GetMapping("/verbesPronominaux")
    public String allerSurverbesPronominaux() {return "verbesPronominaux";
    }

    @GetMapping("/futurProche")
    public String allerSurfuturProche() {return "futurProche";
    }

    @GetMapping("/passeRecent")
    public String allerSurpasseRecent() {return "passéRécent";
    }

    @GetMapping("/pronomsYetEn")
    public String allerSurpronomsYetEn() {return "pronomsYetEn";
    }

    @GetMapping("/laComparaison")
    public String allerSurlaComparaison() {return "laComparaison";
    }

    @GetMapping("/laQuantite")
    public String allerSurlaQuantite() {return "laQuantité";
    }

    @GetMapping("/LesConnecteursSimples")
    public String allerSurLesConnecteursSimples() {return "LesConnecteursSimples";
    }
    @GetMapping("/LeConditionnelDePolitesse")
    public String allerSurLeConditionnelDePolitesse() {return "LeConditionnelDePolitesse";
    }

    @GetMapping("/auxiliaires")
    public String allerSurAuxiliaires() {
        return "auxiliaires";
    }

    @GetMapping("/presentApprofondi")
    public String allerSurpresentApprofondi() {
        return "présentApprofondi";
    }

    @GetMapping("/imparfait")
    public String allerSurImparfait() {
        return "imparfait";
    }

    @GetMapping("/passeComposeOuImparfait")
    public String allerSurpasseComposeOuImparfait() {
        return "passéComposéOuImparfait";
    }

    @GetMapping("/LefuturSimple")
    public String allerAfuturSimple() {
        return "futurSimple";
    }

    @GetMapping("/FuturProcheOuFuturSimple")
    public String allerSurFuturProcheOuFuturSimple() {
        return "FuturProcheOuFuturSimple";
    }

    @GetMapping("/ConditionnelPresent")
    public String allerSurConditionnelPresent() {
        return "ConditionnelPrésent";
    }

    @GetMapping("/ImperatifAvecLesPronoms")
    public String allerSurImperatifAvecLesPronoms() {
        return "ImpératifAvecLesPronoms";
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

    @GetMapping("/lesVerbes") public String verbes() {
        return "verbes";
    }

    @GetMapping("/histoireDFrance") public String histoireDeFrance() {
        return "histoireDeFrance";
    }

    @GetMapping("/expressionsFrancaises") public String expressionsFrancaises() {
        return "expressionsFrancaises";
    }

    @GetMapping("/LesPropositionsSubordonnées") public String LesPropositionsSubordonnées() {
        return "LesPropositionsSubordonnées";
    }

    @GetMapping("/LeBut") public String LeBut() {
        return "LeBut";
    }

    @GetMapping("/LOppositionEtLaConcession") public String LOppositionEtLaConcession() {
        return "LOppositionEtLaConcession";
    }

    @GetMapping("/LesPronomsRelatifs") public String LesPronomsRelatifs() {
        return "LesPronomsRelatifs";
    }

    @GetMapping("/LesHypothèses") public String LesHypothèses() {
        return "LesHypothèses";
    }

    @GetMapping("/LeDiscoursIndirect") public String LeDiscoursIndirect() {
        return "LeDiscoursIndirect";
    }

    @GetMapping("/LaVoixPassive") public String LaVoixPassive() {
        return "LaVoixPassive";
    }

    @GetMapping("/PlusQueParfait") public String PlusQueParfait() {
        return "PlusQueParfait";
    }

    @GetMapping("/FuturAntérieur") public String FuturAntérieur() {
        return "FuturAntérieur";
    }

    @GetMapping("/ConditionnelPrésentSupDeCours") public String ConditionnelPrésent() {
        return "ConditionnelPrésentSupDeCours";
    }

    @GetMapping("/ConditionnelPassé") public String ConditionnelPassé() {
        return "ConditionnelPassé";
    }

    @GetMapping("/LesTroisTypesDhypothèse") public String LesTroisTypesDhypothèse() {
        return "LesTroisTypesDhypothèse";
    }

    @GetMapping("/SubjonctifPrésent") public String SubjonctifPrésent() {
        return "SubjonctifPrésent";
    }

    @GetMapping("/ConcordanceDesTemps") public String ConcordanceDesTemps() {
        return "ConcordanceDesTemps";
    }
    @GetMapping("/LaCauseEtLaConséquence") public String LaCauseEtLaConséquence() {
        return "LaCauseEtLaConséquence";
    }
    @GetMapping("/paris") public String paris() {
        return "paris";
    }
    @GetMapping("/accords") public String accords() {
        return "accords";
    }
    @GetMapping("/phrase") public String phrase() {
        return "phrase";
    }
    @GetMapping("/complements") public String complements() {
        return "compléments";
    }
    @GetMapping("/connecteursLogiques") public String connecteursLogiques() {
        return "connecteursLogiques";
    }
    @GetMapping("/adverbes") public String adverbes() {
        return "adverbes";
    }
}
