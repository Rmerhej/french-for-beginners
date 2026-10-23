package com.apprendrefr.controller;

import com.apprendrefr.dto.ParcoursNiveau;
import com.apprendrefr.dto.ParcoursNiveau.Bloc;
import com.apprendrefr.dto.ParcoursNiveau.Etape;
import com.apprendrefr.service.ParcoursService;
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
    private final ParcoursService parcoursService;

    public CourseController(QuizScoreService quizScoreService, QuizService quizService,
                            ParcoursService parcoursService) {
        this.quizScoreService = quizScoreService;
        this.quizService = quizService;
        this.parcoursService = parcoursService;
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
        for (ParcoursNiveau n : parcoursService.niveaux()) {
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
        List<ParcoursNiveau> niveaux = parcoursService.niveaux();
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
}
