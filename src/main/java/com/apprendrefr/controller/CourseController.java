package com.apprendrefr.controller;

import com.apprendrefr.dto.CoursItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller // <-- 2. Ajoutez cette annotation indispensable ici !
public class CourseController {

    @GetMapping("/supports-de-cours")
    public String supportsDeCours(Model model) {

        List<CoursItem> grammaireA1 = List.of(
                new CoursItem("La phrase simple", "/phrase", "La phrase simple"),
                new CoursItem("Les noms : masculin et féminin", "/lesNomsMasculinetFeminin", "Les noms : masculin et féminin", "text-secondary"),
                new CoursItem("Les articles définis", "/articlesDéfinis", "Les articles définis", "text-danger"),
                new CoursItem("L'adjectif", "/adjectif", "Accords des adjectifs"),
                new CoursItem("Les adjectifs qualificatifs", "/adjectifsQualificatifs", "Les adjectifs qualificatifs", "text-secondary"),
                new CoursItem("Les pronoms personnels", "/PronomsPersonnelsSujets", "Les pronoms", "text-danger"),
                new CoursItem("La négation simple", "/NegationSimple", "La négation simple", "text-primary"),
                new CoursItem("L’interrogation — questions simples", "/questionsSimples", "L'interrogation", "text-secondary"),
                new CoursItem("Les prépositions", "/lesPrépositions", "préposition", "text-danger"),
                new CoursItem("Genre et nombre des noms", "/genreEtNombreDesNoms", "Genre et nombre des noms", "text-primary"),
                new CoursItem("Les accords", "/accords", "Les accords", "text-secondary"),
                new CoursItem("Les compléments", "/complements", "Les compléments", "text-danger"),
                new CoursItem("Les expressions de temps", "/expressionstemps", "Les Expressions de temps", "text-primary")

        );
        List<CoursItem> conjugaisonA1 = List.of(
                new CoursItem("Être et avoir au présent", "/verbesAuPresent", "Être et avoir au présent"),
                new CoursItem("Les verbes", "/lesVerbes", "Les verbes au présent", "text-secondary"),
                new CoursItem("Les verbes réguliers", "/verbesreguliers", "Verbes réguliers", "text-danger"),
                new CoursItem("Les auxiliaires", "/auxiliaires", "Les auxiliaires", "text-primary"),
                new CoursItem("Le présent des verbes en -ER", "/présentdesVerbesEner", "Présent des verbes en ER", "text-secondary"),
                new CoursItem("Les verbes : Aller et faire", "/allerEtFaire", "Aller et Faire", "text-danger"),
                new CoursItem("Les verbes pronominaux", "/verbesPronominaux", "Les verbes pronominaux", "text-primary"),
                new CoursItem("Le futur proche", "/futurProche", "Futur proche", "text-secondary"),
                new CoursItem("Le passé récent", "/passeRecent", "Le passé récent", "text-danger"),
                new CoursItem("L'impératif", "/imperatif", "Impératif", "text-primary")
        );
        List<CoursItem> grammaireA2 = List.of(

                new CoursItem("Les adjectifs démonstratifs", "/adjectifsdemonstratifs", "Adjectifs démonstratifs", "text-primary"),
                new CoursItem("Les adverbes", "/adverbes", "Les adverbes", "text-secondary"),
                new CoursItem("Les expressions de temps", "/expressionstemps", "Les Expressions de temps", "text-danger"),
                new CoursItem("Les accords", "/accords", "Les adjectifs", "text-primary"),
                new CoursItem("Les pronoms y et en", "/LesPronomsYEtEn", "Les pronoms y et en", "text-secondary"),
                new CoursItem("Les pronoms possessifs et démonstratifs", "/pronomsPossessifsEtDemonstratifs", "Pronoms possessifs et démonstratifs", "text-danger"),
                new CoursItem("Conjonction et préposition", "/PrépositionsEtConjonctions", "conjonction", "text-primary"),
                new CoursItem("Les connecteurs logiques", "/connecteursLogiques", "Les connecteurs logiques", "text-secondary"),
                new CoursItem("La comparaison", "/laComparaison", "La comparaison", "text-danger"),
                new CoursItem("La quantité", "/laQuantite", "La quantité", "text-primary"),
                new CoursItem("Les prépositions de lieu et temps", "/PrepositionsDeLieuEtTemps", "Les prépositions de lieu et temps", "text-secondary"),
                new CoursItem("Le conditionnel de politesse", "/LeConditionnelDePolitesse", "Le conditionnel de politesse", "text-danger"),
                new CoursItem("Les connecteurs simples", "/LesConnecteursSimples", "Les connecteurs simples", "text-primary")

        );
        List<CoursItem> conjugaisonA2 = List.of(
                new CoursItem("Les verbes réguliers", "/verbesreguliers", "Les verbes réguliers", "text-primary"),
                new CoursItem("Les auxiliaires", "/auxiliaires", "Les auxiliaires", "text-primary"),
                new CoursItem("Présent approfondi", "/presentApprofondi", "Le présent approfondi", "text-secondary"),
                new CoursItem("Passé composé", "/passecompse", "Le passé composé", "text-danger"),
                new CoursItem("Imparfait", "/imparfait", "Imparfait", "text-primary"),
                new CoursItem("Passé composé ou imparfait", "/passeComposeOuImparfait", "passé composé ou imparfait", "text-secondary"),
                new CoursItem("Futur simple", "/LefuturSimple", "Le futur simple", "text-danger"),
                new CoursItem("Futur proche ou futur simple", "/FuturProcheOuFuturSimple", "Futur proche ou futur simple", "text-primary"),
                new CoursItem("Conditionnel présent", "/ConditionnelPresent", "Le conditionnel présent", "text-secondary")

        );
        List<CoursItem> grammaireB1 = List.of(

                new CoursItem("Les pronoms", "/pronoms", "Les pronomsB1", "text-primary"),
                new CoursItem("Les adverbes", "/adverbes", "Les adverbesB1", "text-secondary"),
                new CoursItem("Les propositions subordonnées", "/LesPropositionsSubordonnées", "Les propositions subordonnées", "text-danger"),
                new CoursItem("La cause et la conséquence", "/LaCauseEtLaConséquence", "La cause et la conséquence", "text-primary"),
                new CoursItem("Le but", "/LeBut", "Le but", "text-secondary"),
                new CoursItem("L'opposition et la concession", "/LOppositionEtLaConcession", "L’opposition et la concession", "text-danger"),
                new CoursItem("Les pronoms relatifs", "/LesPronomsRelatifs", "Les pronoms relatifs", "text-primary"),
                new CoursItem("Les hypothèses", "/LesHypothèses", "Les hypothèses", "text-secondary"),
                new CoursItem("Le discours indirect", "/LeDiscoursIndirect", "Le discours indirect", "text-danger"),
                new CoursItem("La voix passive", "/LaVoixPassive", "La voix passive", "text-primary")


        );
        List<CoursItem> conjugaisonB1 = List.of(

                new CoursItem("Le plus-que-parfait", "/PlusQueParfait", "Le plus-que-parfait", "text-primary"),
                new CoursItem("Le futur antérieur", "/FuturAntérieur", "Le futur antérieur", "text-secondary"),
                new CoursItem("Le conditionnel présent", "/ConditionnelPrésentSupDeCours", "Le conditionnel présent", "text-danger"),
                new CoursItem("Le conditionnel passé", "/ConditionnelPassé", "Le conditionnel passé", "text-primary"),
                new CoursItem("Les trois types d'hypothèses", "/LesTroisTypesDhypothèse", "Les trois types d'hypothèses", "text-secondary"),
                new CoursItem("Concordance des temps", "/ConcordanceDesTemps", "Concordance des temps", "text-danger")
                // new CoursItem("", "/", "", "text-")
        );
        List<CoursItem> grammaireB2 = List.of(
                new CoursItem("Les structures complexes", "/LesStructuresComplexes", "Les structures complexes", "text-"),
                new CoursItem("Les pronoms relatifs complexes", "/LesPronomsRelatifsComplexes", "Les pronoms relatifs complexes", "text-primary"),
                new CoursItem("Le subjonctif", "/LeSubjonctif", "Le subjonctif", "text-secondary"),
                new CoursItem("La concession", "/LaConcession", "La concession", "text-danger"),
                new CoursItem("Les propositions circonstancielles", "/LesPropositionsCirconstancielles", "Les propositions circonstancielles", "text-primary"),
                new CoursItem("La mise en relief", "/LaMiseEnRelief", "La mise en relief", "text-secondary"),
                new CoursItem("Les formes impersonnelles", "/LesFormesImpersonnelles", "Les formes impersonnelles", "text-danger"),
                new CoursItem("Les registres de langue", "/LesRegistresDeLangue", "Les registres de langue", "text-primary")

        );
        List<CoursItem> conjugaisonB2 = List.of(
                new CoursItem("Révision approfondie des temps", "/RévisionApprofondieDesTemps", "Révision approfondie des temps", "text-primary"),
                new CoursItem("Subjonctif présent", "/SubjonctifPrésentB2", "Subjonctif présent", "text-secondary"),
                new CoursItem("Subjonctif passé", "/SubjonctifPassé", "Subjonctif passé", "text-danger"),
                new CoursItem("Conditionnel présent et passé", "/ConditionnelPrésentEtPassé", "Conditionnel présent et passé", "text-primary"),
                new CoursItem("Concordance des temps", "/ConcordanceDesTempsB2", "Concordance des temps", "text-secondary"),
                new CoursItem("Participe présent", "/ParticipePrésent", "Participe présent", "text-danger"),
                new CoursItem("Gérondif", "/Gérondif", "Gérondif", "text-primary"),
                new CoursItem("Infinitif passé", "/InfinitifPassé", "Infinitif passé", "text-secondary")

                // new CoursItem("", "/", "", "text-")
        );
        model.addAttribute("grammaireA1", grammaireA1);
        model.addAttribute("conjugaisonA1", conjugaisonA1);
        model.addAttribute("grammaireA2", grammaireA2);
        model.addAttribute("conjugaisonA2", conjugaisonA2);
        model.addAttribute("grammaireB1", grammaireB1);
        model.addAttribute("conjugaisonB1", conjugaisonB1);
        model.addAttribute("grammaireB2", grammaireB2);
        model.addAttribute("conjugaisonB2", conjugaisonB2);

        return "supports-de-cours";
    }
}