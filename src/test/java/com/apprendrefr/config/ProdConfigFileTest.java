package com.apprendrefr.config;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.assertTrue;

/** Vérifie que la configuration de production reste durcie (messages d'erreur, cookie, cache). */
class ProdConfigFileTest {

    @Test
    void prodProfileIsHardened() throws IOException {
        String yml = Files.readString(Path.of("src/main/resources/application.yml"));
        int prod = yml.indexOf("on-profile: prod");
        assertTrue(prod > 0, "profil prod introuvable");
        String prodPart = yml.substring(prod);

        assertTrue(prodPart.contains("include-message: never"), "les messages d'erreur ne doivent pas être affichés en production");
        assertTrue(prodPart.contains("include-binding-errors: never"));
        assertTrue(prodPart.contains("secure: true"), "le cookie de session doit être « Secure » en production");
        assertTrue(prodPart.contains("forward-headers-strategy: framework"));
        assertTrue(prodPart.matches("(?s).*thymeleaf:\\s+cache: true.*"), "le cache des templates doit être actif en production");
    }
}
