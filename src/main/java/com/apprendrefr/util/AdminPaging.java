package com.apprendrefr.util;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

/**
 * Pagination commune à toutes les listes d'administration :
 * éléments les plus récents d'abord, paramètres de l'adresse protégés
 * (page négative ou taille démesurée).
 */
public final class AdminPaging {

    public static final int DEFAULT_SIZE = 10;
    private static final int MAX_SIZE = 100;

    private AdminPaging() {
    }

    public static Pageable newestFirst(int page, int size) {
        int safePage = Math.max(page, 0);
        int safeSize = Math.min(Math.max(size, 1), MAX_SIZE);
        return PageRequest.of(safePage, safeSize, Sort.by("id").descending());
    }
}
