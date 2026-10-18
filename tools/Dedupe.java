import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.security.MessageDigest;
import java.text.Normalizer;
import java.util.*;
import java.util.regex.*;
import java.util.stream.*;

/**
 * Dédoublonnage des fichiers de uploads/ (images et audio identiques).
 *
 * Lancer depuis la racine du projet (Java 17) :
 *   java tools/Dedupe.java report   -> analyse et génère dedupe-output/ (ne modifie RIEN)
 *   java tools/Dedupe.java seed     -> corrige les chemins dans init-db/*.sql
 *   java tools/Dedupe.java move     -> déplace les doublons vers uploads-duplicates-backup/ (réversible)
 *
 * Ordre conseillé : voir la procédure donnée avec ce script. Rien n'est jamais supprimé définitivement.
 */
public class Dedupe {

    // table, colonne : tous les endroits de la base qui stockent un chemin de fichier
    static final String[][] IMAGE_COLUMNS = {
            {"lessons", "image_url"}, {"vocabularies", "image_url"}, {"quizzes", "image_url"}
    };
    static final String[][] AUDIO_COLUMNS = {
            {"lessons", "audio_url"}, {"vocabularies", "audio_url"}, {"prononciation", "audio"}, {"themes", "audio"}
    };
    static String[][] columnsFor(String webPath) {
        return webPath.startsWith("/uploads/audio/") ? AUDIO_COLUMNS : IMAGE_COLUMNS;
    }
    static final Pattern UUID_PREFIX = Pattern.compile("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-.*");
    static final Pattern CODE_REF = Pattern.compile("uploads/(images|audio)/([^\\s\"'<>)\\\\,;]+)");

    static final Path ROOT = Paths.get(".").toAbsolutePath().normalize();
    static final Path UPLOADS = ROOT.resolve("uploads");
    static final Path OUT = ROOT.resolve("dedupe-output");
    static final Path BACKUP = ROOT.resolve("uploads-duplicates-backup");

    /** Un groupe de fichiers identiques : keep = fichier conservé, others = à remplacer puis déplacer. */
    record Group(String hash, long size, String keep, List<String> others, List<String> protectedOthers) {}

    public static void main(String[] args) throws Exception {
        String cmd = args.length > 0 ? args[0] : "";
        switch (cmd) {
            case "report" -> report();
            case "seed" -> seed();
            case "move" -> move();
            default -> System.out.println("Usage : java tools/Dedupe.java report | seed | move");
        }
    }

    // ---------- analyse ----------
    static String webPath(Path file) {
        // nom réel du fichier, sans normalisation : c'est ce nom exact que la base doit contenir
        return "/" + ROOT.relativize(file).toString().replace('\\', '/');
    }

    static String nfc(String s) { return Normalizer.normalize(s, Normalizer.Form.NFC); }

    static String sha256(Path p) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        try (InputStream in = Files.newInputStream(p)) {
            byte[] buf = new byte[1 << 16];
            int n;
            while ((n = in.read(buf)) > 0) md.update(buf, 0, n);
        }
        return HexFormat.of().formatHex(md.digest());
    }

    /** Chemins cités en dur dans le code (templates, JS, Java) : ces fichiers ne sont jamais déplacés. */
    static Set<String> codeReferences() throws IOException {
        Set<String> refs = new HashSet<>();
        Path src = ROOT.resolve("src/main");
        if (!Files.exists(src)) return refs;
        try (Stream<Path> s = Files.walk(src)) {
            for (Path p : (Iterable<Path>) s.filter(Files::isRegularFile)::iterator) {
                String n = p.toString().toLowerCase();
                if (!(n.endsWith(".html") || n.endsWith(".js") || n.endsWith(".java") || n.endsWith(".css")
                        || n.endsWith(".yml") || n.endsWith(".properties"))) continue;
                Matcher m = CODE_REF.matcher(Files.readString(p, StandardCharsets.UTF_8));
                while (m.find()) refs.add(nfc("/uploads/" + m.group(1) + "/" + m.group(2)));
            }
        }
        return refs;
    }

    static List<Group> analyse() throws Exception {
        if (!Files.isDirectory(UPLOADS)) throw new IllegalStateException("Dossier uploads/ introuvable : lancez la commande depuis la racine du projet.");
        Map<String, List<Path>> byHash = new TreeMap<>();
        try (Stream<Path> s = Files.walk(UPLOADS)) {
            List<Path> files = s.filter(Files::isRegularFile).sorted().toList();
            for (Path f : files) byHash.computeIfAbsent(sha256(f), k -> new ArrayList<>()).add(f);
        }
        Set<String> refs = codeReferences();
        List<Group> groups = new ArrayList<>();
        for (var e : byHash.entrySet()) {
            List<Path> list = e.getValue();
            if (list.size() < 2) continue;
            List<String> paths = list.stream().map(Dedupe::webPath).sorted().collect(Collectors.toList());
            List<String> inCode = paths.stream().filter(p -> refs.contains(nfc(p))).toList();
            String keep;
            if (!inCode.isEmpty()) keep = inCode.get(0);
            else keep = paths.stream().min(Comparator
                    .comparing((String p) -> UUID_PREFIX.matcher(p.substring(p.lastIndexOf('/') + 1)).matches())
                    .thenComparingInt(String::length).thenComparing(Comparator.naturalOrder())).get();
            List<String> others = new ArrayList<>(), prot = new ArrayList<>();
            for (String p : paths) {
                if (p.equals(keep)) continue;
                if (refs.contains(nfc(p))) prot.add(p); else others.add(p);
            }
            groups.add(new Group(e.getKey(), list.get(0).toFile().length(), keep, others, prot));
        }
        return groups;
    }

    static String q(String s) { return "'" + s.replace("'", "''") + "'"; }

    static void report() throws Exception {
        List<Group> groups = analyse();
        Files.createDirectories(OUT);
        long redundant = 0; int files = 0, prot = 0;
        StringBuilder csv = new StringBuilder("hash;taille_octets;conserve;doublon\n");
        StringBuilder upd = new StringBuilder("-- Remplace, dans la base, les chemins de doublons par le chemin du fichier conservé.\n"
                + "-- FAITES UNE SAUVEGARDE (mysqldump) AVANT. Exécutable plusieurs fois sans risque.\nSTART TRANSACTION;\n");
        StringBuilder ver = new StringBuilder("-- Vérification : chaque requête doit renvoyer 0.\n");
        StringBuilder tsv = new StringBuilder();
        List<String> allDups = new ArrayList<>();
        for (Group g : groups) {
            for (String d : g.others()) {
                csv.append(g.hash(), 0, 12).append(';').append(g.size()).append(';').append(g.keep()).append(';').append(d).append('\n');
                tsv.append(d).append('\t').append(g.keep()).append('\n');
                allDups.add(d); redundant += g.size(); files++;
                for (String[] c : columnsFor(d))
                    upd.append("UPDATE ").append(c[0]).append(" SET ").append(c[1]).append(" = ").append(q(g.keep()))
                       .append(" WHERE ").append(c[1]).append(" = ").append(q(d)).append(";\n");
            }
            prot += g.protectedOthers().size();
        }
        upd.append("COMMIT;\n");
        for (String[][] cols : new String[][][]{IMAGE_COLUMNS, AUDIO_COLUMNS}) {
            List<String> dups = allDups.stream().filter(d -> columnsFor(d) == cols).toList();
            if (dups.isEmpty()) continue;
            for (String[] c : cols) {
                ver.append("SELECT '").append(c[0]).append('.').append(c[1]).append("' AS colonne, COUNT(*) AS references_restantes FROM ")
                   .append(c[0]).append(" WHERE ").append(c[1]).append(" IN (\n  ");
                ver.append(dups.stream().map(Dedupe::q).collect(Collectors.joining(",\n  "))).append(");\n");
            }
        }
        Files.writeString(OUT.resolve("report.csv"), csv, StandardCharsets.UTF_8);
        Files.writeString(OUT.resolve("01-update.sql"), upd, StandardCharsets.UTF_8);
        Files.writeString(OUT.resolve("02-verify.sql"), ver, StandardCharsets.UTF_8);
        Files.writeString(OUT.resolve("dups.tsv"), tsv, StandardCharsets.UTF_8);
        System.out.printf("Groupes de doublons : %d%n", groups.size());
        System.out.printf("Fichiers redondants : %d (%.1f Mo récupérables)%n", files, redundant / 1048576.0);
        System.out.printf("Fichiers identiques mais cités dans le code, conservés : %d%n", prot);
        System.out.println("Fichiers générés dans : " + OUT);
    }

    // ---------- init-db/*.sql ----------
    static void seed() throws Exception {
        List<Group> groups = analyse();
        Map<String, String> map = new HashMap<>();
        for (Group g : groups) for (String d : g.others()) map.put(nfc(d), g.keep());
        Path dir = ROOT.resolve("init-db");
        if (!Files.isDirectory(dir)) { System.out.println("Pas de dossier init-db."); return; }
        Pattern p = Pattern.compile("/uploads/(?:images|audio)/[^'\"]+(?=['\"])");
        int total = 0;
        try (Stream<Path> s = Files.list(dir)) {
            for (Path f : (Iterable<Path>) s.filter(x -> x.toString().endsWith(".sql"))::iterator) {
                String text = Files.readString(f, StandardCharsets.UTF_8);
                Matcher m = p.matcher(text);
                StringBuilder sb = new StringBuilder(); int n = 0;
                while (m.find()) {
                    String rep = map.get(nfc(m.group()));
                    if (rep != null) { n++; m.appendReplacement(sb, Matcher.quoteReplacement(rep)); }
                    else m.appendReplacement(sb, Matcher.quoteReplacement(m.group()));
                }
                m.appendTail(sb);
                if (n > 0) Files.writeString(f, sb.toString(), StandardCharsets.UTF_8);
                System.out.printf("%s : %d chemins remplacés%n", f.getFileName(), n);
                total += n;
            }
        }
        System.out.println("Total : " + total + ". Vérifiez avec 'git diff init-db' (annulable par 'git restore init-db').");
    }

    // ---------- déplacement ----------
    static void move() throws Exception {
        Path tsv = OUT.resolve("dups.tsv");
        if (!Files.exists(tsv)) { System.out.println("Lancez d'abord : java tools/Dedupe.java report"); return; }
        List<String[]> pairs = Files.readAllLines(tsv, StandardCharsets.UTF_8).stream()
                .filter(l -> !l.isBlank()).map(l -> l.split("\t")).toList();
        System.out.printf("%d fichiers vont être DÉPLACÉS vers %s (rien n'est supprimé).%n", pairs.size(), BACKUP.getFileName());
        System.out.print("Avez-vous exécuté 01-update.sql sur la base et vérifié 02-verify.sql (tout à 0) ? Tapez OUI : ");
        String answer = new Scanner(System.in).nextLine().trim();
        if (!answer.equals("OUI")) { System.out.println("Annulé."); return; }
        int moved = 0, skipped = 0;
        for (String[] pr : pairs) {
            Path dup = ROOT.resolve(pr[0].substring(1)), keep = ROOT.resolve(pr[1].substring(1));
            if (!Files.exists(dup)) { skipped++; continue; }
            if (!Files.exists(keep) || !sha256(dup).equals(sha256(keep))) {
                System.out.println("IGNORÉ (le fichier conservé est absent ou différent) : " + pr[0]); skipped++; continue;
            }
            Path target = BACKUP.resolve(ROOT.relativize(dup));
            Files.createDirectories(target.getParent());
            Files.move(dup, target, StandardCopyOption.REPLACE_EXISTING);
            moved++;
        }
        System.out.printf("Déplacés : %d ; ignorés : %d. Annulation possible : remettre les fichiers depuis %s%n", moved, skipped, BACKUP.getFileName());
    }
}
