package com.apprendrefr.util;

import java.util.List;
import java.util.Optional;

/** Langues dans lesquelles les textes des leçons peuvent être traduits (le français reste la langue de référence). */
public enum TranslationLang {
    ZH("zh", "中文", false),
    KO("ko", "한국어", false),
    PT("pt", "Português", false),
    ES("es", "Español", false);
    // Pour ajouter l'anglais ou l'arabe plus tard : EN("en", "English", false) ; l'arabe : AR("ar", "العربية", true) (la page s'affiche alors de droite à gauche).

    private final String code;
    private final String label;
    private final boolean rtl;

    TranslationLang(String code, String label, boolean rtl) {
        this.code = code;
        this.label = label;
        this.rtl = rtl;
    }

    public String getCode() { return code; }

    /** Nom de la langue écrit dans cette langue (affiché sur le bouton de choix). */
    public String getLabel() { return label; }

    /** Vrai si la langue s'écrit de droite à gauche. */
    public boolean isRtl() { return rtl; }

    public static List<TranslationLang> all() {
        return List.of(values());
    }

    /** Renvoie la langue pour un code reconnu (« zh », « es »…), sinon rien. Aucune autre valeur n'est acceptée. */
    public static Optional<TranslationLang> of(String code) {
        if (code == null) {
            return Optional.empty();
        }
        for (TranslationLang l : values()) {
            if (l.code.equals(code)) {
                return Optional.of(l);
            }
        }
        return Optional.empty();
    }
}
