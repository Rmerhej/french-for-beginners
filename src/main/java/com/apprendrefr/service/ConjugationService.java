package com.apprendrefr.service;

import com.apprendrefr.dto.Conjugation;
import com.apprendrefr.dto.Conjugation.Mood;
import com.apprendrefr.dto.Conjugation.Tense;
import org.springframework.stereotype.Service;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.TreeMap;

/**
 * Conjugueur de verbes français, sans service externe.
 *
 * <p>Les verbes courants sont décrits ici (verbes irréguliers écrits à la main, verbes réguliers
 * générés par règle). Un verbe en -er inconnu et sans particularité est conjugué par la règle
 * générale, avec un avertissement.</p>
 */
@Service
public class ConjugationService {

    private static final String[] PERSONS = {"je", "tu", "il/elle/on", "nous", "vous", "ils/elles"};
    private static final String[] SUBJ_PERSONS = {"que je", "que tu", "qu'il/elle/on", "que nous", "que vous", "qu'ils/elles"};
    private static final String[] IMPARFAIT_END = {"ais", "ais", "ait", "ions", "iez", "aient"};
    private static final String[] FUTURE_END = {"ai", "as", "a", "ons", "ez", "ont"};
    private static final String[] SUBJ_END = {"e", "es", "e", "ions", "iez", "ent"};

    /** Verbes en -er particuliers. */
    private static final Set<String> DOUBLE_CONSONANT = Set.of("appeler", "rappeler", "épeler", "jeter", "rejeter", "projeter", "étiqueter");
    private static final Set<String> GRAVE_ACCENT = Set.of("acheter", "racheter", "geler", "congeler", "peler", "lever", "élever", "enlever",
            "soulever", "mener", "amener", "emmener", "ramener", "promener", "peser", "semer");
    private static final Set<String> ACUTE_ACCENT = Set.of("préférer", "espérer", "répéter", "posséder", "célébrer", "considérer",
            "compléter", "exagérer", "inquiéter", "protéger", "révéler", "sécher", "suggérer", "accélérer", "interpréter",
            "tolérer", "régler", "gérer");
    private static final Set<String> ETRE_ER = Set.of("arriver", "entrer", "rentrer", "monter", "retourner", "tomber", "rester", "passer");
    private static final Set<String> DUAL_AUXILIARY = Set.of("monter", "descendre", "sortir", "rentrer", "retourner", "passer");

    private static final String[] ER_VERBS = ("parler aimer habiter travailler manger commencer appeler jeter acheter préférer payer envoyer "
            + "nettoyer étudier regarder écouter chanter danser cuisiner marcher penser donner trouver chercher demander arriver entrer "
            + "rentrer monter retourner tomber rester passer utiliser téléphoner voyager changer déménager commander visiter oublier "
            + "rencontrer montrer porter laver jouer fermer aider apporter arrêter continuer décider expliquer inviter laisser nager "
            + "organiser préparer présenter rappeler répéter réserver retrouver tourner traverser emmener amener lever mener peser "
            + "geler espérer posséder célébrer considérer essayer employer épeler projeter protéger partager déranger ranger lancer "
            + "placer remplacer avancer prononcer annoncer recommencer effacer renvoyer rejeter racheter enlever promener "
            + "compléter exagérer révéler suggérer régler gérer tolérer rêver ajouter casser couper coûter dépenser dessiner "
            + "diviser durer échanger fumer gagner garder goûter imaginer informer marier mériter oser parier "
            + "pleurer pousser proposer quitter raconter refuser regretter remercier respecter signer "
            + "sonner tirer toucher tuer vérifier").split(" ");

    private static final String[] RE_VERBS = ("attendre vendre rendre répondre perdre entendre descendre défendre dépendre étendre tendre "
            + "prétendre fondre mordre tordre pondre tondre correspondre confondre suspendre pendre répandre").split(" ");

    private static final String[] IR2_VERBS = ("finir choisir réussir grandir remplir réfléchir obéir grossir maigrir rougir applaudir "
            + "établir ralentir réunir saisir punir bâtir fournir nourrir guérir avertir démolir accomplir atterrir vieillir "
            + "pâlir salir investir").split(" ");

    private static final String[] PARTIR_VERBS = {"partir", "sortir", "dormir", "servir", "sentir", "mentir", "repartir", "ressortir"};
    private static final String[] OUVRIR_VERBS = {"ouvrir:ouvert", "offrir:offert", "couvrir:couvert", "souffrir:souffert", "découvrir:découvert"};
    private static final String[] CONDUIRE_VERBS = {"conduire", "construire", "traduire", "produire", "détruire", "réduire", "séduire"};
    private static final String[] RECEVOIR_VERBS = {"recevoir", "apercevoir", "décevoir", "concevoir"};

    private final Map<String, Verb> verbs = new TreeMap<>(String::compareTo);
    private final Map<String, String> byFolded = new LinkedHashMap<>();

    /** Description complète d'un verbe : une ligne de six formes par temps simple. */
    private record Verb(String infinitive, String group, boolean etre, boolean dual, boolean unknownEr,
                        String pastParticiple, String presentParticiple,
                        String[] present, String[] imparfait, String[] future, String[] conditional,
                        String[] subjunctive, String[] imperative /* tu, nous, vous ou null */) {
    }

    public ConjugationService() {
        registerIrregulars();
        registerRegulars();
        for (String infinitive : verbs.keySet()) {
            byFolded.put(fold(infinitive), infinitive);
        }
    }

    // ------------------------------------------------------------------ API

    public List<String> knownVerbs() {
        return new ArrayList<>(verbs.keySet());
    }

    public Optional<Conjugation> conjugate(String input) {
        if (input == null) {
            return Optional.empty();
        }
        String wanted = input.trim().toLowerCase(Locale.ROOT).replaceAll("\\s+", " ");
        if (wanted.isEmpty() || wanted.length() > 40) {
            return Optional.empty();
        }
        Verb verb = verbs.get(wanted);
        if (verb == null && byFolded.containsKey(fold(wanted))) {
            verb = verbs.get(byFolded.get(fold(wanted)));
        }
        if (verb == null && isSafeUnknownEr(wanted)) {
            verb = regularEr(wanted, true);
        }
        return Optional.ofNullable(verb).map(this::toConjugation);
    }

    // ------------------------------------------------------------------ présentation

    private Conjugation toConjugation(Verb v) {
        Verb avoir = verbs.get("avoir");
        Verb etre = verbs.get("être");
        Verb aux = v.etre() ? etre : avoir;

        List<Mood> moods = new ArrayList<>();
        moods.add(new Mood("Indicatif", List.of(
                new Tense("Présent", lines(PERSONS, v.present())),
                new Tense("Imparfait", lines(PERSONS, v.imparfait())),
                new Tense("Futur simple", lines(PERSONS, v.future())),
                new Tense("Passé composé", compound(PERSONS, aux.present(), v)),
                new Tense("Plus-que-parfait", compound(PERSONS, aux.imparfait(), v)),
                new Tense("Futur antérieur", compound(PERSONS, aux.future(), v)))));
        moods.add(new Mood("Conditionnel", List.of(
                new Tense("Présent", lines(PERSONS, v.conditional())),
                new Tense("Passé", compound(PERSONS, aux.conditional(), v)))));
        moods.add(new Mood("Subjonctif", List.of(
                new Tense("Présent", lines(SUBJ_PERSONS, v.subjunctive())),
                new Tense("Passé", compound(SUBJ_PERSONS, aux.subjunctive(), v)))));
        if (v.imperative() != null) {
            moods.add(new Mood("Impératif", List.of(new Tense("Présent", List.of(
                    v.imperative()[0], v.imperative()[1], v.imperative()[2])))));
        }

        String note = null;
        if (v.unknownEr()) {
            note = "Ce verbe n'est pas dans notre liste : il est conjugué avec la règle générale des verbes en -er. "
                    + "Vérifiez dans un dictionnaire si vous avez un doute.";
        } else if (v.dual()) {
            note = "Ce verbe se conjugue avec « être » sans complément d'objet direct (Elle est sortie), "
                    + "et avec « avoir » avec un complément d'objet direct (Elle a sorti la poubelle). "
                    + "Les temps composés ci-dessous sont donnés avec « être ».";
        }
        return new Conjugation(v.infinitive(), v.group(), v.etre() ? "être" : "avoir",
                v.pastParticiple(), v.presentParticiple(), note, moods);
    }

    private static List<String> lines(String[] persons, String[] forms) {
        List<String> out = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            out.add(withPronoun(persons[i], forms[i]));
        }
        return out;
    }

    private static List<String> compound(String[] persons, String[] auxForms, Verb v) {
        List<String> out = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            String participle = v.pastParticiple();
            if (v.etre()) {
                participle += (i < 3) ? "(e)" : (i == 4 ? "(e)(s)" : "(e)s");
            }
            out.add(withPronoun(persons[i], auxForms[i] + " " + participle));
        }
        return out;
    }

    private static String withPronoun(String pronoun, String form) {
        if ((pronoun.equals("je") || pronoun.equals("que je")) && startsWithVowel(form)) {
            return pronoun.substring(0, pronoun.length() - 1) + "'" + form;
        }
        return pronoun + " " + form;
    }

    private static boolean startsWithVowel(String s) {
        return !s.isEmpty() && "aeiouyhàâäéèêëîïôöùûüœ".indexOf(Character.toLowerCase(s.charAt(0))) >= 0;
    }

    // ------------------------------------------------------------------ recherche

    static String fold(String text) {
        String decomposed = Normalizer.normalize(text, Normalizer.Form.NFD);
        return decomposed.replaceAll("\\p{M}+", "").toLowerCase(Locale.ROOT);
    }

    /** Verbe en -er inconnu, sans particularité orthographique risquée. */
    private boolean isSafeUnknownEr(String word) {
        if (!word.matches("[a-zàâäéèêëîïôöùûüç]{3,}er") || word.equals("aller")) {
            return false;
        }
        // e/é + consonne(s) + er : acheter, lever, préférer… (trop de cas particuliers)
        return !word.matches(".*[eé][bcdfgklmnprstvz]{1,2}er$") && !word.endsWith("yer")
                && !word.endsWith("eler") && !word.endsWith("eter") && !word.endsWith("éer");
    }

    // ------------------------------------------------------------------ verbes réguliers

    private void registerRegulars() {
        for (String inf : ER_VERBS) {
            if (!verbs.containsKey(inf)) {
                verbs.put(inf, regularEr(inf, false));
            }
        }
        for (String inf : IR2_VERBS) {
            verbs.put(inf, regularIr2(inf));
        }
        for (String inf : RE_VERBS) {
            verbs.put(inf, regularRe(inf));
        }
        for (String inf : PARTIR_VERBS) {
            verbs.put(inf, partirType(inf));
        }
        for (String spec : OUVRIR_VERBS) {
            String[] p = spec.split(":");
            verbs.put(p[0], ouvrirType(p[0], p[1]));
        }
        for (String inf : CONDUIRE_VERBS) {
            verbs.put(inf, conduireType(inf));
        }
        for (String inf : RECEVOIR_VERBS) {
            verbs.put(inf, recevoirType(inf));
        }
    }

    private Verb regularEr(String inf, boolean unknown) {
        String base = inf.substring(0, inf.length() - 2);
        boolean yer = inf.endsWith("yer");
        String strong;
        if (DOUBLE_CONSONANT.contains(inf)) {
            strong = base + base.charAt(base.length() - 1);
        } else if (GRAVE_ACCENT.contains(inf)) {
            strong = replaceLast(base, 'e', 'è');
        } else if (ACUTE_ACCENT.contains(inf)) {
            strong = replaceLast(base, 'é', 'è');
        } else if (yer) {
            strong = base.substring(0, base.length() - 1) + "i";
        } else {
            strong = base;
        }
        boolean changesFuture = DOUBLE_CONSONANT.contains(inf) || GRAVE_ACCENT.contains(inf) || yer;
        String futureStem = (changesFuture ? strong : base) + "er";
        if (inf.equals("envoyer")) {
            futureStem = "enverr";
        } else if (inf.equals("renvoyer")) {
            futureStem = "renverr";
        }

        String[] present = {strong + "e", strong + "es", strong + "e", weak(base, "ons") + "ons", base + "ez", strong + "ent"};
        String[] imparfait = new String[6];
        String[] subjunctive = {strong + "e", strong + "es", strong + "e", base + "ions", base + "iez", strong + "ent"};
        for (int i = 0; i < 6; i++) {
            imparfait[i] = (i < 3 || i == 5) ? weak(base, "a") + IMPARFAIT_END[i] : base + IMPARFAIT_END[i];
        }
        String[] imperative = {strong + "e", present[3], present[4]};
        boolean etre = ETRE_ER.contains(inf);
        return new Verb(inf, "1er groupe", etre, DUAL_AUXILIARY.contains(inf), unknown,
                base + "é", weak(base, "a") + "ant",
                present, imparfait, future(futureStem), conditional(futureStem), subjunctive, imperative);
    }

    private Verb regularIr2(String inf) {
        String stem = inf.substring(0, inf.length() - 1);              // fini
        String[] present = {stem + "s", stem + "s", stem + "t", stem + "ssons", stem + "ssez", stem + "ssent"};
        String[] imparfait = new String[6];
        String[] subjunctive = new String[6];
        for (int i = 0; i < 6; i++) {
            imparfait[i] = stem + "ss" + IMPARFAIT_END[i];
            subjunctive[i] = stem + "ss" + SUBJ_END[i];
        }
        return new Verb(inf, "2e groupe", false, false, false, stem, stem + "ssant",
                present, imparfait, future(inf), conditional(inf), subjunctive,
                new String[]{present[1], present[3], present[4]});
    }

    private Verb regularRe(String inf) {
        String stem = inf.substring(0, inf.length() - 2);              // attend
        String[] present = {stem + "s", stem + "s", stem, stem + "ons", stem + "ez", stem + "ent"};
        String[] imparfait = new String[6];
        String[] subjunctive = new String[6];
        for (int i = 0; i < 6; i++) {
            imparfait[i] = stem + IMPARFAIT_END[i];
            subjunctive[i] = stem + SUBJ_END[i];
        }
        String futureStem = inf.substring(0, inf.length() - 1);        // attendr
        boolean etre = inf.equals("descendre");
        return new Verb(inf, "3e groupe", etre, DUAL_AUXILIARY.contains(inf), false, stem + "u", stem + "ant",
                present, imparfait, future(futureStem), conditional(futureStem), subjunctive,
                new String[]{present[1], present[3], present[4]});
    }

    /** partir, sortir, dormir, servir, sentir, mentir. */
    private Verb partirType(String inf) {
        String stem = inf.substring(0, inf.length() - 2);              // part
        String shortStem = stem.substring(0, stem.length() - 1);       // par
        String[] present = {shortStem + "s", shortStem + "s", shortStem + "t", stem + "ons", stem + "ez", stem + "ent"};
        boolean etre = inf.equals("partir") || inf.equals("sortir") || inf.equals("repartir") || inf.equals("ressortir");
        return build(inf, "3e groupe", etre, DUAL_AUXILIARY.contains(inf), stem + "i", present, inf, null, null, null);
    }

    /** ouvrir, offrir, couvrir, souffrir, découvrir. */
    private Verb ouvrirType(String inf, String participle) {
        String stem = inf.substring(0, inf.length() - 2);              // ouvr
        String[] present = {stem + "e", stem + "es", stem + "e", stem + "ons", stem + "ez", stem + "ent"};
        return build(inf, "3e groupe", false, false, participle, present, inf, null, null, null);
    }

    /** conduire, construire, traduire, produire, détruire. */
    private Verb conduireType(String inf) {
        String stem = inf.substring(0, inf.length() - 2);              // condui
        String[] present = {stem + "s", stem + "s", stem + "t", stem + "sons", stem + "sez", stem + "sent"};
        return build(inf, "3e groupe", false, false, stem + "t", present, inf.substring(0, inf.length() - 1), null, null, null);
    }

    /** recevoir, apercevoir, décevoir, concevoir. */
    private Verb recevoirType(String inf) {
        String stem = inf.substring(0, inf.length() - 5);              // rec
        String cedilla = stem.substring(0, stem.length() - 1) + "ç";   // reç
        String[] present = {cedilla + "ois", cedilla + "ois", cedilla + "oit", stem + "evons", stem + "evez", cedilla + "oivent"};
        return build(inf, "3e groupe", false, false, cedilla + "u", present, stem + "evr", null, null, null);
    }

    // ------------------------------------------------------------------ verbes irréguliers

    private void registerIrregulars() {
        // être et avoir en premier : ils servent d'auxiliaires.
        put(build("avoir", "3e groupe", false, false, "eu",
                arr("ai", "as", "a", "avons", "avez", "ont"), "aur", "aie,aies,ait,ayons,ayez,aient", "ayant", "aie,ayons,ayez"));
        put(build("être", "3e groupe", false, false, "été",
                arr("suis", "es", "est", "sommes", "êtes", "sont"), "ser", "sois,sois,soit,soyons,soyez,soient", "étant", "sois,soyons,soyez", "ét"));
        put(build("aller", "3e groupe", true, false, "allé",
                arr("vais", "vas", "va", "allons", "allez", "vont"), "ir", "aille,ailles,aille,allions,alliez,aillent", null, "va,allons,allez"));
        put(build("faire", "3e groupe", false, false, "fait",
                arr("fais", "fais", "fait", "faisons", "faites", "font"), "fer", "fasse,fasses,fasse,fassions,fassiez,fassent", null, "fais,faisons,faites"));
        put(build("pouvoir", "3e groupe", false, false, "pu",
                arr("peux", "peux", "peut", "pouvons", "pouvez", "peuvent"), "pourr", "puisse,puisses,puisse,puissions,puissiez,puissent", null, "none"));
        put(build("vouloir", "3e groupe", false, false, "voulu",
                arr("veux", "veux", "veut", "voulons", "voulez", "veulent"), "voudr", "veuille,veuilles,veuille,voulions,vouliez,veuillent", null, "veux,voulons,voulez"));
        put(build("devoir", "3e groupe", false, false, "dû",
                arr("dois", "dois", "doit", "devons", "devez", "doivent"), "devr", null, null, "dois,devons,devez"));
        put(build("savoir", "3e groupe", false, false, "su",
                arr("sais", "sais", "sait", "savons", "savez", "savent"), "saur", "sache,saches,sache,sachions,sachiez,sachent", "sachant", "sache,sachons,sachez"));
        put(build("valoir", "3e groupe", false, false, "valu",
                arr("vaux", "vaux", "vaut", "valons", "valez", "valent"), "vaudr", "vaille,vailles,vaille,valions,valiez,vaillent", null, "none"));
        put(build("voir", "3e groupe", false, false, "vu",
                arr("vois", "vois", "voit", "voyons", "voyez", "voient"), "verr", null, null, null));
        put(build("prévoir", "3e groupe", false, false, "prévu",
                arr("prévois", "prévois", "prévoit", "prévoyons", "prévoyez", "prévoient"), "prévoir", null, null, null));
        put(build("revoir", "3e groupe", false, false, "revu",
                arr("revois", "revois", "revoit", "revoyons", "revoyez", "revoient"), "reverr", null, null, null));
        put(build("croire", "3e groupe", false, false, "cru",
                arr("crois", "crois", "croit", "croyons", "croyez", "croient"), "croir", null, null, null));
        put(build("boire", "3e groupe", false, false, "bu",
                arr("bois", "bois", "boit", "buvons", "buvez", "boivent"), "boir", null, null, null));
        put(build("dire", "3e groupe", false, false, "dit",
                arr("dis", "dis", "dit", "disons", "dites", "disent"), "dir", null, null, "dis,disons,dites"));
        put(build("lire", "3e groupe", false, false, "lu",
                arr("lis", "lis", "lit", "lisons", "lisez", "lisent"), "lir", null, null, null));
        put(build("relire", "3e groupe", false, false, "relu",
                arr("relis", "relis", "relit", "relisons", "relisez", "relisent"), "relir", null, null, null));
        put(build("écrire", "3e groupe", false, false, "écrit",
                arr("écris", "écris", "écrit", "écrivons", "écrivez", "écrivent"), "écrir", null, null, null));
        put(build("décrire", "3e groupe", false, false, "décrit",
                arr("décris", "décris", "décrit", "décrivons", "décrivez", "décrivent"), "décrir", null, null, null));
        put(build("vivre", "3e groupe", false, false, "vécu",
                arr("vis", "vis", "vit", "vivons", "vivez", "vivent"), "vivr", null, null, null));
        put(build("suivre", "3e groupe", false, false, "suivi",
                arr("suis", "suis", "suit", "suivons", "suivez", "suivent"), "suivr", null, null, null));
        put(build("plaire", "3e groupe", false, false, "plu",
                arr("plais", "plais", "plaît", "plaisons", "plaisez", "plaisent"), "plair", null, null, null));
        put(build("rire", "3e groupe", false, false, "ri",
                arr("ris", "ris", "rit", "rions", "riez", "rient"), "rir", null, null, null));
        put(build("courir", "3e groupe", false, false, "couru",
                arr("cours", "cours", "court", "courons", "courez", "courent"), "courr", null, null, null));
        put(build("parcourir", "3e groupe", false, false, "parcouru",
                arr("parcours", "parcours", "parcourt", "parcourons", "parcourez", "parcourent"), "parcourr", null, null, null));
        put(build("mourir", "3e groupe", true, false, "mort",
                arr("meurs", "meurs", "meurt", "mourons", "mourez", "meurent"), "mourr", null, null, null));
        put(build("naître", "3e groupe", true, false, "né",
                arr("nais", "nais", "naît", "naissons", "naissez", "naissent"), "naîtr", null, null, null));
        put(build("connaître", "3e groupe", false, false, "connu",
                arr("connais", "connais", "connaît", "connaissons", "connaissez", "connaissent"), "connaîtr", null, null, null));
        put(build("reconnaître", "3e groupe", false, false, "reconnu",
                arr("reconnais", "reconnais", "reconnaît", "reconnaissons", "reconnaissez", "reconnaissent"), "reconnaîtr", null, null, null));
        put(build("paraître", "3e groupe", false, false, "paru",
                arr("parais", "parais", "paraît", "paraissons", "paraissez", "paraissent"), "paraîtr", null, null, null));
        put(build("apparaître", "3e groupe", false, false, "apparu",
                arr("apparais", "apparais", "apparaît", "apparaissons", "apparaissez", "apparaissent"), "apparaîtr", null, null, null));
        put(build("disparaître", "3e groupe", false, false, "disparu",
                arr("disparais", "disparais", "disparaît", "disparaissons", "disparaissez", "disparaissent"), "disparaîtr", null, null, null));

        family("venir", "venu", true, new String[]{"viens", "viens", "vient", "venons", "venez", "viennent"}, "viendr", "viens,venons,venez",
                "", "de", "re", "par");
        family("tenir", "tenu", false, new String[]{"tiens", "tiens", "tient", "tenons", "tenez", "tiennent"}, "tiendr", "tiens,tenons,tenez",
                "", "ob", "re", "main", "con", "sou", "appar");
        family("prendre", "pris", false, new String[]{"prends", "prends", "prend", "prenons", "prenez", "prennent"}, "prendr", "prends,prenons,prenez",
                "", "com", "ap", "sur", "re", "entre");
        family("mettre", "mis", false, new String[]{"mets", "mets", "met", "mettons", "mettez", "mettent"}, "mettr", "mets,mettons,mettez",
                "", "per", "pro", "re", "ad", "sou", "com");
    }

    /** Verbes qui se forment sur un même modèle en ajoutant un préfixe (venir → devenir, revenir…). */
    private void family(String bare, String participle, boolean etre, String[] present, String futureStem, String imperative, String... prefixes) {
        for (String prefix : prefixes) {
            String[] forms = new String[6];
            for (int i = 0; i < 6; i++) {
                forms[i] = prefix + present[i];
            }
            String[] imp = imperative.split(",");
            for (int i = 0; i < 3; i++) {
                imp[i] = prefix + imp[i];
            }
            put(build(prefix + bare, "3e groupe", etre, false, prefix + participle, forms, prefix + futureStem,
                    null, null, String.join(",", imp)));
        }
    }

    private void put(Verb v) {
        verbs.put(v.infinitive(), v);
    }

    private static String[] arr(String... s) {
        return s;
    }

    private Verb build(String inf, String group, boolean etre, boolean dual, String pp, String[] present,
                       String futureStem, String subjunctive, String presentParticiple, String imperative) {
        return build(inf, group, etre, dual, pp, present, futureStem, subjunctive, presentParticiple, imperative, null);
    }

    private Verb build(String inf, String group, boolean etre, boolean dual, String pp, String[] present,
                       String futureStem, String subjunctive, String presentParticiple, String imperative, String imparfaitStem) {
        String nous = present[3];
        String stem = imparfaitStem != null ? imparfaitStem : nous.substring(0, nous.length() - 3);   // « nous » sans -ons

        String[] imparfait = new String[6];
        for (int i = 0; i < 6; i++) {
            imparfait[i] = stem + IMPARFAIT_END[i];
        }
        String[] subj = new String[6];
        if (subjunctive != null) {
            subj = subjunctive.split(",");
        } else {
            String strong = present[5].substring(0, present[5].length() - 3);                       // « ils » sans -ent
            for (int i = 0; i < 6; i++) {
                subj[i] = ((i == 3 || i == 4) ? stem : strong) + SUBJ_END[i];
            }
        }
        String[] imp;
        if ("none".equals(imperative)) {
            imp = null;
        } else if (imperative != null) {
            imp = imperative.split(",");
        } else {
            String tu = present[1];
            if (tu.endsWith("es")) {
                tu = tu.substring(0, tu.length() - 1);                  // ouvres → ouvre
            }
            imp = new String[]{tu, present[3], present[4]};
        }
        return new Verb(inf, group, etre, dual, false, pp,
                presentParticiple != null ? presentParticiple : stem + "ant",
                present, imparfait, future(futureStem), conditional(futureStem), subj, imp);
    }

    private static String[] future(String stem) {
        String[] out = new String[6];
        for (int i = 0; i < 6; i++) {
            out[i] = stem + FUTURE_END[i];
        }
        return out;
    }

    private static String[] conditional(String stem) {
        String[] out = new String[6];
        for (int i = 0; i < 6; i++) {
            out[i] = stem + IMPARFAIT_END[i];
        }
        return out;
    }

    // ------------------------------------------------------------------ outils d'orthographe

    private static String replaceLast(String text, char from, char to) {
        int index = text.lastIndexOf(from);
        return index < 0 ? text : text.substring(0, index) + to + text.substring(index + 1);
    }

    /** Radical avant une terminaison commençant par a ou o : mange-ons, commenç-ons. */
    private static String weak(String base, String nextEnding) {
        char first = nextEnding.charAt(0);
        if (first == 'a' || first == 'o') {
            if (base.endsWith("g")) {
                return base + "e";
            }
            if (base.endsWith("c")) {
                return base.substring(0, base.length() - 1) + "ç";
            }
        }
        return base;
    }
}
