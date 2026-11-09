package com.apprendrefr.service;

import com.apprendrefr.entity.Translation;
import com.apprendrefr.repository.TranslationRepository;
import com.apprendrefr.util.TranslationLang;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/** Choix de la langue de traduction (mémorisée dans un cookie) et lecture des traductions enregistrées. */
@Service
@Transactional(readOnly = true)
public class TranslationService {

    public static final String COOKIE = "ffb_lang";

    private final TranslationRepository repository;

    public TranslationService(TranslationRepository repository) {
        this.repository = repository;
    }

    /**
     * Détermine la langue à afficher. Le paramètre d'adresse « ?lang=ar » gagne et est mémorisé ; « ?lang=fr »
     * (ou toute valeur inconnue) efface le choix. Sans paramètre, on utilise le cookie. Seules les langues
     * de {@link TranslationLang} sont acceptées : aucune valeur reçue n'est recopiée dans la page.
     */
    public Optional<TranslationLang> resolve(String langParam, String cookieValue, HttpServletResponse response) {
        if (langParam != null) {
            Optional<TranslationLang> chosen = TranslationLang.of(langParam);
            writeCookie(response, chosen.map(TranslationLang::getCode).orElse(null));
            return chosen;
        }
        return TranslationLang.of(cookieValue);
    }

    private void writeCookie(HttpServletResponse response, String code) {
        ResponseCookie cookie = ResponseCookie.from(COOKIE, code == null ? "" : code)
                .path("/")
                .secure(true)
                .sameSite("Lax")
                .maxAge(code == null ? Duration.ZERO : Duration.ofDays(365))
                .build();
        response.addHeader(HttpHeaders.SET_COOKIE, cookie.toString());
    }

    public Optional<Translation> find(String kind, Long entityId, TranslationLang lang) {
        return repository.findByKindAndEntityIdAndLang(kind, entityId, lang.getCode());
    }

    /** Textes traduits (identifiant du mot -> texte) pour une liste de mots. */
    public Map<Long, String> contents(String kind, Collection<Long> entityIds, TranslationLang lang) {
        Map<Long, String> map = new HashMap<>();
        if (entityIds == null || entityIds.isEmpty()) {
            return map;
        }
        for (Translation t : repository.findByKindAndLangAndEntityIdIn(kind, lang.getCode(), entityIds)) {
            map.put(t.getEntityId(), t.getContent());
        }
        return map;
    }
}
