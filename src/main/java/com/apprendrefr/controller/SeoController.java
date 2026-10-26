package com.apprendrefr.controller;

import com.apprendrefr.config.StaticPagesConfig;
import com.apprendrefr.entity.Lesson;
import com.apprendrefr.service.LessonService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.util.UriUtils;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/** robots.txt et sitemap.xml (pages publiques seulement). */
@Controller
public class SeoController {

    /** Pages consultables sans compte (voir SecurityConfig) et utiles aux moteurs de recherche. */
    static final List<String> PUBLIC_PAGES = List.of(
            "/", "/supports-de-cours", "/about", "/contact", "/rgpd", "/installer",
            "/prononciation", "/cultureFrancaise", "/themes", "/chiffresEtLettres", "/lesVerbes",
            "/niveauDebutant", "/niveauConsolidation", "/niveauApprofondissement", "/lessons", "/conjugueur", "/testEval");

    private final String baseUrl;
    private final LessonService lessonService;

    public SeoController(@Value("${app.base-url:https://frenchforbeginners.duckdns.org}") String baseUrl,
                         LessonService lessonService) {
        this.lessonService = lessonService;
        this.baseUrl = baseUrl.endsWith("/") ? baseUrl.substring(0, baseUrl.length() - 1) : baseUrl;
    }

    /** Pages fixes + toutes les pages de cours de StaticPagesConfig (sans doublon, dans l'ordre alphabétique). */
    public static List<String> publicPages() {
        Set<String> all = new LinkedHashSet<>(PUBLIC_PAGES);
        all.addAll(new TreeSet<>(StaticPagesConfig.paths()));
        return List.copyOf(all);
    }

    @GetMapping("/robots.txt")
    public ResponseEntity<String> robots() {
        String body = "User-agent: *\n"
                + "Disallow: /admin/\n"
                + "Disallow: /api/\n"
                + "Disallow: /login\n"
                + "Disallow: /register\n"
                + "Disallow: /mes-resultats\n"
                + "\n"
                + "Sitemap: " + baseUrl + "/sitemap.xml\n";
        return ResponseEntity.ok().contentType(MediaType.TEXT_PLAIN).body(body);
    }

    @GetMapping("/sitemap.xml")
    public ResponseEntity<String> sitemap() {
        StringBuilder xml = new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
                .append("<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n");
        List<String> paths = new ArrayList<>(publicPages());
        for (Lesson lesson : lessonService.findAll()) {
            paths.add("/lesson/" + lesson.getId());
        }
        for (String path : paths) {
            // Les accents (ex. /impératif) doivent être encodés dans un plan de site
            xml.append("  <url><loc>").append(baseUrl).append(UriUtils.encodePath(path, StandardCharsets.UTF_8))
                    .append("</loc></url>\n");
        }
        xml.append("</urlset>\n");
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_XML).body(xml.toString());
    }
}
