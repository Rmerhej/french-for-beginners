package com.apprendrefr.service;

import org.springframework.stereotype.Component;
import org.springframework.web.util.HtmlUtils;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Page « Prononciation » : met en évidence, dans les mots d'exemple, les lettres du son travaillé
 * (par exemple « ô » dans « drôle », « euil » dans « feuille »).
 * <p>
 * Les lettres à repérer viennent du titre de la carte : « é ; er ; ez », « u ≠ ou », « ô », « c + e / i / y » (on repère « c »), etc.
 * Seuls les petits groupes de lettres sont pris en compte ; une explication entre parenthèses
 * (« e muet (e non prononcé) ») ne met rien en évidence. Tout le texte est protégé (HTML échappé) :
 * seul le balisage {@code <strong class="son-lettres">} est ajouté.
 */
@Component("pronunciationHighlighter")
public class PronunciationHighlighter {

    private static final Pattern GROUP_SEPARATOR = Pattern.compile(";");
    private static final Pattern TOKEN_SEPARATORS = Pattern.compile("[≠/,]");
    private static final Pattern PARENTHESES = Pattern.compile("\\([^)]*\\)");
    /** « c + e / i / y », « ch : cha ; chi », « ss = [s] » : seul ce qui précède le signe est le son à repérer. */
    private static final Pattern CUT = Pattern.compile("[+:=]");
    private static final Pattern LETTERS_ONLY = Pattern.compile("^\\p{L}{1,5}$");

    /** @return le texte d'exemple prêt à afficher (HTML sûr), avec les lettres du son en évidence. */
    public String highlight(String son, String exemple) {
        if (exemple == null) {
            return "";
        }
        String text = Normalizer.normalize(exemple, Normalizer.Form.NFC);
        List<String> patterns = patterns(son);
        if (patterns.isEmpty()) {
            return escape(text);
        }
        // Les groupes les plus longs d'abord : « ou » est repéré avant « u »
        String alternation = String.join("|", patterns.stream().map(Pattern::quote).toList());
        Matcher m = Pattern.compile(alternation, Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE).matcher(text);
        StringBuilder out = new StringBuilder();
        int last = 0;
        while (m.find()) {
            out.append(escape(text.substring(last, m.start())));
            out.append("<strong class=\"son-lettres\">").append(escape(m.group())).append("</strong>");
            last = m.end();
        }
        out.append(escape(text.substring(last)));
        return out.toString();
    }

    /** Protège &, <, >, " et ' seulement : les lettres accentuées restent telles quelles (pas de « &ocirc; »). */
    private static String escape(String text) {
        return HtmlUtils.htmlEscape(text, "UTF-8");
    }

    static List<String> patterns(String son) {
        List<String> result = new ArrayList<>();
        if (son == null) {
            return result;
        }
        String normalized = Normalizer.normalize(son, Normalizer.Form.NFC);
        for (String group : GROUP_SEPARATOR.split(normalized)) {
            String cleaned = PARENTHESES.matcher(group).replaceAll(" ");
            String head = CUT.split(cleaned, 2)[0];
            for (String part : TOKEN_SEPARATORS.split(head)) {
                String token = part.strip();
                if (LETTERS_ONLY.matcher(token).matches() && result.stream().noneMatch(token::equalsIgnoreCase)) {
                    result.add(token);
                }
            }
        }
        result.sort(Comparator.comparingInt(String::length).reversed());
        return result;
    }
}
