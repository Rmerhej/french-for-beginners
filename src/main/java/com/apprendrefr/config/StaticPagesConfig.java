package com.apprendrefr.config;

import java.util.Map;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Pour ajouter une page, ajouter une ligne "URL" -> "nom du template (sans .html)".
 * (Remplace l'ancien StaticPagesController.)
 */
@Configuration
public class StaticPagesConfig implements WebMvcConfigurer {

    private static final Map<String, String> PAGES = Map.ofEntries(
            Map.entry("/chiffresEtLettres", "chiffresEtLettres"),
            Map.entry("/cultureFrancaise", "cultureFrancaise"),
            Map.entry("/fetesFrancaise", "fetesfrancise"),
            Map.entry("/politesse", "politesse"),
            Map.entry("/lesRegions", "lesregions"),
            Map.entry("/lesTransports", "lestransports"),
            Map.entry("/lesRepas", "lesrepas"),
            Map.entry("/adjectif", "adjectif"),
            Map.entry("/pronoms", "pronoms"),
            Map.entry("/imperatif", "impératif"),
            Map.entry("/passecompse", "le_passé_composé"),
            Map.entry("/adjectifsdemonstratifs", "adjectifs-demonstratifs"),
            Map.entry("/expressionstemps", "expressions-temps"),
            Map.entry("/verbesreguliers", "verbes-reguliers"),
            Map.entry("/lesNomsMasculinetFeminin", "lesNomsMasculinetFeminin"),
            Map.entry("/lesPrépositions", "lesPrépositions"),
            Map.entry("/présentdesVerbesEner", "présentdesVerbesEner"),
            Map.entry("/allerEtFaire", "allerEtFaire"),
            Map.entry("/verbesPronominaux", "verbesPronominaux"),
            Map.entry("/futurProche", "futurProche"),
            Map.entry("/passeRecent", "passéRécent"),
            Map.entry("/pronomsYetEn", "pronomsYetEn"),
            Map.entry("/laComparaison", "laComparaison"),
            Map.entry("/laQuantite", "laQuantité"),
            Map.entry("/LesConnecteursSimples", "LesConnecteursSimples"),
            Map.entry("/LeConditionnelDePolitesse", "LeConditionnelDePolitesse"),
            Map.entry("/auxiliaires", "auxiliaires"),
            Map.entry("/presentApprofondi", "présentApprofondi"),
            Map.entry("/imparfait", "imparfait"),
            Map.entry("/passeComposeOuImparfait", "passéComposéOuImparfait"),
            Map.entry("/LefuturSimple", "futurSimple"),
            Map.entry("/FuturProcheOuFuturSimple", "FuturProcheOuFuturSimple"),
            Map.entry("/ConditionnelPresent", "ConditionnelPrésent"),
            Map.entry("/ImperatifAvecLesPronoms", "ImpératifAvecLesPronoms"),
            Map.entry("/articlesDéfinis", "articles-definis"),
            Map.entry("/articlesIndéfinisEtPartitifs", "articles-indefinis-partitifs"),
            Map.entry("/adjectifsPossessifs", "adjectifs-possessifs"),
            Map.entry("/verbesIrréguliersCourants", "verbes-irreguliers-courants"),
            Map.entry("/genreEtNombreDesNoms", "genre-et-nombre-des-noms"),
            Map.entry("/adjectifsQualificatifs", "adjectifs-qualificatifs"),
            Map.entry("/PronomsPersonnelsSujets", "pronoms-personnels-sujets"),
            Map.entry("/PrépositionsEtConjonctions", "PrépositionsEtConjonctions"),
            Map.entry("/verbesAuPresent", "verbes-au-present"),
            Map.entry("/NegationSimple", "negation-simple"),
            Map.entry("/questionsSimples", "questions-simples"),
            Map.entry("/PrepositionsDeLieuEtTemps", "propositions-de-lieu-et-de-temps"),
            Map.entry("/pronomsPossessifsEtDemonstratifs", "pronoms-possessifs-et-demonstratifs"),
            Map.entry("/lesVerbes", "verbes"),
            Map.entry("/histoireDFrance", "histoireDeFrance"),
            Map.entry("/expressionsFrancaises", "expressionsFrancaises"),
            Map.entry("/LesPropositionsSubordonnées", "LesPropositionsSubordonnées"),
            Map.entry("/LeBut", "LeBut"),
            Map.entry("/LOppositionEtLaConcession", "LOppositionEtLaConcession"),
            Map.entry("/LesPronomsRelatifs", "LesPronomsRelatifs"),
            Map.entry("/LesHypothèses", "LesHypothèses"),
            Map.entry("/LeDiscoursIndirect", "LeDiscoursIndirect"),
            Map.entry("/LaVoixPassive", "LaVoixPassive"),
            Map.entry("/PlusQueParfait", "PlusQueParfait"),
            Map.entry("/FuturAntérieur", "FuturAntérieur"),
            Map.entry("/ConditionnelPrésentSupDeCours", "ConditionnelPrésentSupDeCours"),
            Map.entry("/ConditionnelPassé", "ConditionnelPassé"),
            Map.entry("/LesTroisTypesDhypothèse", "LesTroisTypesDhypothèse"),
            Map.entry("/SubjonctifPrésent", "SubjonctifPrésent"),
            Map.entry("/ConcordanceDesTemps", "ConcordanceDesTemps"),
            Map.entry("/LesStructuresComplexes", "LesStructuresComplexes"),
            Map.entry("/LesPronomsRelatifsComplexes", "LesPronomsRelatifsComplexes"),
            Map.entry("/LeSubjonctif", "LeSubjonctif"),
            Map.entry("/LaConcession", "LaConcession"),
            Map.entry("/LesPropositionsCirconstancielles", "LesPropositionsCirconstancielles"),
            Map.entry("/LaMiseEnRelief", "LaMiseEnRelief"),
            Map.entry("/LesFormesImpersonnelles", "LesFormesImpersonnelles"),
            Map.entry("/LesRegistresDeLangue", "LesRegistresDeLangue"),
            Map.entry("/RévisionApprofondieDesTemps", "RévisionApprofondieDesTemps"),
            Map.entry("/SubjonctifPrésentB2", "SubjonctifPrésent"),
            Map.entry("/SubjonctifPassé", "SubjonctifPassé"),
            Map.entry("/ConditionnelPrésentEtPassé", "ConditionnelPrésentEtPassé"),
            Map.entry("/ConcordanceDesTempsB2", "ConcordanceDesTemps"),
            Map.entry("/ParticipePrésent", "ParticipePrésent"),
            Map.entry("/Gérondif", "Gérondif"),
            Map.entry("/InfinitifPassé", "InfinitifPassé"),
            Map.entry("/LaCauseEtLaConséquence", "LaCauseEtLaConséquence"),
            Map.entry("/paris", "paris"),
            Map.entry("/accords", "accords"),
            Map.entry("/phrase", "phrase"),
            Map.entry("/complements", "compléments"),
            Map.entry("/connecteursLogiques", "connecteursLogiques"),
            Map.entry("/adverbes", "adverbes"),
            Map.entry("/installer", "installer"),
            // Cours « approfondis » (2e niveau des cours qui étaient en double)
            Map.entry("/accordsApprofondis", "accordsApprofondis"),
            Map.entry("/expressionsTempsApprofondies", "expressionsTempsApprofondies"),
            Map.entry("/verbesReguliersApprofondis", "verbesReguliersApprofondis"),
            Map.entry("/auxiliairesApprofondis", "auxiliairesApprofondis"),
            Map.entry("/adverbesApprofondis", "adverbesApprofondis")
    );

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        PAGES.forEach((url, template) -> registry.addViewController(url).setViewName(template));
    }
}
