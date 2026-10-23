package com.apprendrefr.controller;

import com.apprendrefr.dto.ParcoursNiveau;
import com.apprendrefr.dto.ParcoursNiveau.Bloc;
import com.apprendrefr.dto.ParcoursNiveau.Etape;
import com.apprendrefr.service.QuizScoreService;
import com.apprendrefr.service.QuizService;
import com.apprendrefr.service.QuizScoreService.Progress;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
public class CourseController {

    private final QuizScoreService quizScoreService;
    private final QuizService quizService;

    public CourseController(QuizScoreService quizScoreService, QuizService quizService) {
        this.quizScoreService = quizScoreService;
        this.quizService = quizService;
    }

    /** Une ligne du contrôle : une étape du parcours et le nombre de quiz trouvés pour son lien « Quiz ». */
    public record LigneControle(String niveau, String etape, String url, String recherche, int nbQuiz) {
    }

    /**
     * Page admin : pour chaque étape, combien de quiz le lien « Quiz » trouve-t-il ?
     * Utilise la même recherche que la page /quiz/drag-drop, donc le résultat est exact.
     */
    @GetMapping("/admin/parcours-check")
    public String controleParcours(Model model) {
        List<LigneControle> lignes = new ArrayList<>();
        for (ParcoursNiveau n : List.of(a1(), a2(), b1(), b2())) {
            for (Bloc b : n.blocs()) {
                for (Etape e : b.etapes()) {
                    int nb = quizService.findByTitleContainingIgnoreCase(e.quiz()).size();
                    lignes.add(new LigneControle(n.code(), e.titre(), e.url(), e.quiz(), nb));
                }
            }
        }
        long sansQuiz = lignes.stream().filter(l -> l.nbQuiz() == 0).count();
        model.addAttribute("lignes", lignes);
        model.addAttribute("sansQuiz", sansQuiz);
        return "admin/parcours-check";
    }

    @GetMapping("/supports-de-cours")
    public String supportsDeCours(Model model, Principal principal,
                                  @org.springframework.web.bind.annotation.RequestParam(name = "niveau", required = false) String niveau) {
        List<ParcoursNiveau> niveaux = List.of(a1(), a2(), b1(), b2());
        model.addAttribute("niveaux", niveaux);

        // ?niveau=A2 : n'afficher que ce niveau (les 4 boutons du haut restent disponibles)
        List<ParcoursNiveau> affiches = niveaux.stream()
                .filter(n -> niveau != null && n.code().equalsIgnoreCase(niveau.trim()))
                .toList();
        boolean filtre = !affiches.isEmpty();
        model.addAttribute("affiches", filtre ? affiches : niveaux);
        model.addAttribute("niveauChoisi", filtre ? affiches.get(0).code() : null);

        boolean connecte = principal != null;
        model.addAttribute("connecte", connecte);

        // Progression : étape terminée = tous ses quiz réussis à 100 %
        Map<String, Progress> progres = new LinkedHashMap<>();
        Map<String, Progress> parNiveau = new LinkedHashMap<>();
        if (connecte) {
            Set<String> titres = new LinkedHashSet<>();
            for (ParcoursNiveau n : niveaux) {
                for (Bloc b : n.blocs()) {
                    for (Etape e : b.etapes()) {
                        titres.add(e.quiz());
                    }
                }
            }
            progres = quizScoreService.progressByTitle(principal.getName(), titres);
            for (ParcoursNiveau n : niveaux) {
                int total = 0;
                int done = 0;
                for (Bloc b : n.blocs()) {
                    for (Etape e : b.etapes()) {
                        total++;
                        Progress p = progres.get(e.quiz());
                        if (p != null && p.complete()) {
                            done++;
                        }
                    }
                }
                parNiveau.put(n.code(), new Progress(done, total));
            }
        }
        model.addAttribute("progres", progres);
        model.addAttribute("progresNiveau", parNiveau);
        return "supports-de-cours";
    }

    // ------------------------------------------------------------------ A1
    private ParcoursNiveau a1() {
        return niveau("A1", "🟢", "Construire", "Les bases du français",
                "Vous saurez vous présenter, décrire des personnes et des objets, parler de votre quotidien et poser des questions simples.",
                "success",
                bloc("Se présenter",
                        g("La phrase simple", "/phrase", "La phrase simple"),
                        g("Les pronoms personnels", "/PronomsPersonnelsSujets", "Les pronoms"),
                        c("Être et avoir au présent", "/verbesAuPresent", "Être et avoir au présent")),
                bloc("Nommer et décrire",
                        g("Les noms : masculin et féminin", "/lesNomsMasculinetFeminin", "Les noms : masculin et féminin"),
                        g("Genre et nombre des noms", "/genreEtNombreDesNoms", "Genre et nombre des noms"),
                        g("Les articles définis", "/articlesDéfinis", "Les articles définis"),
                        g("L'adjectif", "/adjectif", "Accords des adjectifs"),
                        g("Les adjectifs qualificatifs", "/adjectifsQualificatifs", "Les adjectifs qualificatifs"),
                        g("Les accords", "/accords", "Les accords")),
                bloc("Parler de son quotidien",
                        c("Les verbes", "/lesVerbes", "Les verbes au présent"),
                        c("Les verbes réguliers", "/verbesreguliers", "Verbes réguliers"),
                        c("Le présent des verbes en -ER", "/présentdesVerbesEner", "Présent des verbes en ER"),
                        c("Aller et faire", "/allerEtFaire", "Aller et Faire"),
                        c("Les verbes pronominaux", "/verbesPronominaux", "Les verbes pronominaux"),
                        c("Le futur proche", "/futurProche", "Futur proche")),
                bloc("Poser des questions et donner des instructions",
                        g("La négation simple", "/NegationSimple", "La négation simple"),
                        g("L'interrogation : questions simples", "/questionsSimples", "L'interrogation"),
                        g("Les prépositions", "/lesPrépositions", "préposition"),
                        g("Les expressions de temps", "/expressionstemps", "Les Expressions de temps"),
                        c("L'impératif", "/imperatif", "Impératif")));
    }

    // ------------------------------------------------------------------ A2
    private ParcoursNiveau a2() {
        return niveau("A2", "🟡", "Raconter", "Parler de son passé et de ses projets",
                "Vous saurez raconter un événement passé, parler de vos projets, comparer, exprimer une quantité et demander poliment.",
                "warning",
                bloc("Enrichir ses phrases",
                        g("Les adjectifs démonstratifs", "/adjectifsdemonstratifs", "Adjectifs démonstratifs"),
                        g("Les adverbes", "/adverbes", "Les adverbes"),
                        g("Les compléments", "/complements", "Les compléments"),
                        g("La quantité", "/laQuantite", "La quantité"),
                        g("La comparaison", "/laComparaison", "La comparaison"),
                        g("Les prépositions de lieu et de temps", "/PrepositionsDeLieuEtTemps", "Les prépositions de lieu et temps"),
                        g("Conjonctions et prépositions", "/PrépositionsEtConjonctions", "conjonction")),
                bloc("Éviter les répétitions",
                        g("Les pronoms compléments", "/pronoms", "Les pronomsB1"),
                        g("Les pronoms y et en", "/pronomsYetEn", "Les pronoms y et en"),
                        g("Les pronoms possessifs et démonstratifs", "/pronomsPossessifsEtDemonstratifs", "Pronoms possessifs et démonstratifs")),
                bloc("Raconter au passé",
                        c("Les auxiliaires", "/auxiliaires", "Les auxiliaires"),
                        c("Le présent approfondi", "/presentApprofondi", "Le présent approfondi"),
                        c("Le passé composé", "/passecompse", "Le passé composé"),
                        c("Le passé récent", "/passeRecent", "Le passé récent"),
                        c("L'imparfait", "/imparfait", "Imparfait"),
                        c("Passé composé ou imparfait", "/passeComposeOuImparfait", "passé composé ou imparfait")),
                bloc("Parler de l'avenir et demander poliment",
                        c("Le futur simple", "/LefuturSimple", "Le futur simple"),
                        c("Futur proche ou futur simple", "/FuturProcheOuFuturSimple", "Futur proche ou futur simple"),
                        g("Le conditionnel de politesse", "/LeConditionnelDePolitesse", "Le conditionnel de politesse"),
                        c("Le conditionnel présent", "/ConditionnelPresent", "Le conditionnel présent")),
                bloc("Relier ses idées",
                        g("Les connecteurs simples", "/LesConnecteursSimples", "Les connecteurs simples"),
                        g("Les connecteurs logiques", "/connecteursLogiques", "Les connecteurs logiques")));
    }

    // ------------------------------------------------------------------ B1
    private ParcoursNiveau b1() {
        return niveau("B1", "🟠", "Expliquer", "Expliquer et justifier",
                "Vous saurez justifier un choix, exprimer la cause, le but ou l'opposition, formuler des hypothèses et rapporter des paroles.",
                "orange",
                bloc("Raconter avec précision",
                        c("Le plus-que-parfait", "/PlusQueParfait", "Le plus-que-parfait"),
                        c("Le futur antérieur", "/FuturAntérieur", "Le futur antérieur")),
                bloc("Relier et justifier",
                        g("Les propositions subordonnées", "/LesPropositionsSubordonnées", "Les propositions subordonnées"),
                        g("La cause et la conséquence", "/LaCauseEtLaConséquence", "La cause et la conséquence"),
                        g("Le but", "/LeBut", "Le but"),
                        g("L'opposition et la concession", "/LOppositionEtLaConcession", "L’opposition et la concession"),
                        g("Les pronoms relatifs", "/LesPronomsRelatifs", "Les pronoms relatifs")),
                bloc("Imaginer et supposer",
                        g("Les hypothèses", "/LesHypothèses", "Les hypothèses"),
                        c("Le conditionnel passé", "/ConditionnelPassé", "Le conditionnel passé"),
                        c("Les trois types d'hypothèses", "/LesTroisTypesDhypothèse", "Les trois types d'hypothèses")),
                bloc("Rapporter et reformuler",
                        g("Le discours indirect", "/LeDiscoursIndirect", "Le discours indirect"),
                        g("La voix passive", "/LaVoixPassive", "La voix passive")));
    }

    // ------------------------------------------------------------------ B2
    private ParcoursNiveau b2() {
        return niveau("B2", "🔴", "Nuancer", "Argumenter et nuancer",
                "Vous saurez argumenter, nuancer votre pensée, condenser vos phrases et adapter votre registre de langue.",
                "danger",
                bloc("Maîtriser les temps",
                        c("Révision approfondie des temps", "/RévisionApprofondieDesTemps", "Révision approfondie des temps"),
                        c("Le conditionnel (synthèse)", "/ConditionnelPrésentEtPassé", "Conditionnel présent et passé"),
                        c("La concordance des temps", "/ConcordanceDesTempsB2", "Concordance des temps")),
                bloc("Le subjonctif",
                        g("Le subjonctif", "/LeSubjonctif", "Le subjonctif"),
                        c("Le subjonctif présent", "/SubjonctifPrésentB2", "Subjonctif présent"),
                        c("Le subjonctif passé", "/SubjonctifPassé", "Subjonctif passé")),
                bloc("Condenser la phrase",
                        c("Le participe présent", "/ParticipePrésent", "Participe présent"),
                        c("Le gérondif", "/Gérondif", "Gérondif"),
                        c("L'infinitif passé", "/InfinitifPassé", "Infinitif passé"),
                        g("Les structures complexes", "/LesStructuresComplexes", "Les structures complexes"),
                        g("Les pronoms relatifs complexes", "/LesPronomsRelatifsComplexes", "Les pronoms relatifs complexes")),
                bloc("Nuancer son discours",
                        g("La concession", "/LaConcession", "La concession"),
                        g("Les propositions circonstancielles", "/LesPropositionsCirconstancielles", "Les propositions circonstancielles"),
                        g("La mise en relief", "/LaMiseEnRelief", "La mise en relief"),
                        g("Les formes impersonnelles", "/LesFormesImpersonnelles", "Les formes impersonnelles"),
                        g("Les registres de langue", "/LesRegistresDeLangue", "Les registres de langue")));
    }

    // ------------------------------------------------------------ helpers
    private static Etape g(String titre, String url, String quiz) {
        return new Etape(titre, url, quiz, "G");
    }

    private static Etape c(String titre, String url, String quiz) {
        return new Etape(titre, url, quiz, "C");
    }

    /** Un bloc non numéroté : la numérotation est calculée dans niveau(). */
    private static Bloc bloc(String titre, Etape... etapes) {
        return new Bloc(titre, 0, List.of(etapes));
    }

    private static ParcoursNiveau niveau(String code, String emoji, String verbe, String titre,
                                         String objectif, String couleur, Bloc... blocs) {
        List<Bloc> numerotes = new ArrayList<>();
        int debut = 1;
        for (Bloc b : blocs) {
            numerotes.add(new Bloc(b.titre(), debut, b.etapes()));
            debut += b.etapes().size();
        }
        return new ParcoursNiveau(code, emoji, verbe, titre, objectif, couleur, List.copyOf(numerotes));
    }
}
