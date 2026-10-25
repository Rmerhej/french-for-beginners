package com.apprendrefr.service;

import com.apprendrefr.dto.ParcoursNiveau;
import com.apprendrefr.dto.ParcoursNiveau.Bloc;
import com.apprendrefr.dto.ParcoursNiveau.Etape;
import com.apprendrefr.service.QuizScoreService.Progress;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Le parcours A1 → B2 (liste des étapes) et la recherche de la prochaine étape à faire. */
@Service
public class ParcoursService {

    /** Niveaux dans l'ordre du parcours. */
    public static final List<String> CODES = List.of("A1", "A2", "B1", "B2");

    /** Prochaine étape d'un apprenant ; {@code etape} est null quand tout le parcours est terminé. */
    public record Suivi(Etape etape, String niveau, String couleur, String bloc, int numero, int faites, int total,
                        String niveauTest) {
        public boolean termine() {
            return etape == null;
        }

        public boolean commence() {
            return faites > 0;
        }
    }

    private final QuizScoreService quizScoreService;

    public ParcoursService(QuizScoreService quizScoreService) {
        this.quizScoreService = quizScoreService;
    }

    public List<ParcoursNiveau> niveaux() {
        return List.of(a1(), a2(), b1(), b2());
    }

    /**
     * Première étape dont les quiz ne sont pas tous à 100 %. Une étape sans aucun quiz trouvé est ignorée
     * tant qu'il reste une étape avec quiz (pour ne pas bloquer l'apprenant).
     */
    public Suivi suivi(String username) {
        return suivi(username, null);
    }

    /**
     * Prochaine étape. Si l'apprenant a fait le test de positionnement ({@code niveauTest}, ex. « B1 »),
     * on cherche d'abord à partir de ce niveau ; les niveaux précédents restent le dernier recours.
     */
    public Suivi suivi(String username, String niveauTest) {
        List<ParcoursNiveau> niveaux = niveaux();
        Set<String> titres = new LinkedHashSet<>();
        for (ParcoursNiveau n : niveaux) {
            for (Bloc b : n.blocs()) {
                for (Etape e : b.etapes()) {
                    titres.add(e.quiz());
                }
            }
        }
        Map<String, Progress> progres = quizScoreService.progressByTitle(username, titres);
        String test = niveauTest != null && CODES.contains(niveauTest) ? niveauTest : null;
        int depart = test == null ? 0 : CODES.indexOf(test);

        int total = 0;
        int faites = 0;
        // Ordre de préférence : étape avec quiz puis étape sans quiz, à partir du niveau de départ ; puis avant.
        Suivi[] choix = new Suivi[4];
        for (ParcoursNiveau n : niveaux) {
            boolean apres = CODES.indexOf(n.code()) >= depart;
            for (Bloc b : n.blocs()) {
                int numero = b.debut();
                for (Etape e : b.etapes()) {
                    total++;
                    Progress p = progres.get(e.quiz());
                    if (p != null && p.complete()) {
                        faites++;
                    } else {
                        Suivi candidate = new Suivi(e, n.code(), n.couleur(), b.titre(), numero, 0, 0, null);
                        boolean avecQuiz = p != null && p.total() > 0;
                        int rang = (apres ? 0 : 2) + (avecQuiz ? 0 : 1);
                        if (choix[rang] == null) {
                            choix[rang] = candidate;
                        }
                    }
                    numero++;
                }
            }
        }
        Suivi choisie = null;
        for (Suivi c : choix) {
            if (c != null) {
                choisie = c;
                break;
            }
        }
        return choisie == null
                ? new Suivi(null, null, null, null, 0, faites, total, test)
                : new Suivi(choisie.etape(), choisie.niveau(), choisie.couleur(), choisie.bloc(), choisie.numero(), faites, total, test);
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
                        g("Les articles indéfinis et partitifs", "/articlesIndéfinisEtPartitifs", "Les articles indéfinis et partitifs"),
                        g("L'adjectif", "/adjectif", "Accords des adjectifs"),
                        g("Les adjectifs qualificatifs", "/adjectifsQualificatifs", "Les adjectifs qualificatifs"),
                        g("Les adjectifs possessifs", "/adjectifsPossessifs", "Les adjectifs possessifs"),
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
                        g("Les accords approfondis", "/accordsApprofondis", "Accords approfondis"),
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
                        c("Les verbes en -ir, -re et -yer", "/verbesReguliersApprofondis", "Verbes en -ir, -re et -yer"),
                        c("Le présent approfondi", "/presentApprofondi", "Le présent approfondi"),
                        c("Les verbes irréguliers courants", "/verbesIrréguliersCourants", "Les verbes irréguliers courants"),
                        c("Le passé composé", "/passecompse", "Le passé composé"),
                        c("Choisir l'auxiliaire : être ou avoir", "/auxiliairesApprofondis", "Choisir l'auxiliaire"),
                        c("Le passé récent", "/passeRecent", "Le passé récent"),
                        c("L'imparfait", "/imparfait", "Imparfait"),
                        c("Passé composé ou imparfait", "/passeComposeOuImparfait", "passé composé ou imparfait"),
                        g("Repères de temps : depuis, il y a, dans, en", "/expressionsTempsApprofondies", "Repères de temps approfondis")),
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
                        g("Les adverbes approfondis", "/adverbesApprofondis", "Adverbes en -ment et place"),
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
