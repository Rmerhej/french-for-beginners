package com.apprendrefr.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/** robots.txt et sitemap.xml (pages publiques seulement). */
@Controller
public class SeoController {

    /** Pages consultables sans compte (voir SecurityConfig) et utiles aux moteurs de recherche. */
    static final List<String> PUBLIC_PAGES = List.of(
            "/", "/supports-de-cours", "/about", "/contact", "/rgpd", "/installer",
            "/prononciation", "/cultureFrancaise", "/themes", "/chiffresEtLettres", "/lesVerbes");

    private final String baseUrl;

    public SeoController(@Value("${app.base-url:https://frenchforbeginners.duckdns.org}") String baseUrl) {
        this.baseUrl = baseUrl.endsWith("/") ? baseUrl.substring(0, baseUrl.length() - 1) : baseUrl;
    }

    public static List<String> publicPages() {
        return PUBLIC_PAGES;
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
        for (String path : PUBLIC_PAGES) {
            xml.append("  <url><loc>").append(baseUrl).append("/".equals(path) ? "/" : path).append("</loc></url>\n");
        }
        xml.append("</urlset>\n");
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_XML).body(xml.toString());
    }
}
