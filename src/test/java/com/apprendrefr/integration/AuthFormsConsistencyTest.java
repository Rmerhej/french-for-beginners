package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.assertj.core.api.Assertions.assertThat;

/** Connexion et inscription : même largeur de carte et mêmes marges, et champs avec le bon « autocomplete ». */
class AuthFormsConsistencyTest {

    private static String read(String name) throws IOException {
        return Files.readString(Path.of("src/main/resources/templates").resolve(name));
    }

    @Test
    void loginAndRegisterShareTheSameCardWidthAndPadding() throws IOException {
        for (String page : new String[]{"login.html", "register.html"}) {
            String html = read(page);
            assertThat(html).as(page).contains("<div class=\"col-md-6\">").contains("card-body p-4");
        }
    }

    @Test
    void registerFieldsHaveAutocompleteHints() throws IOException {
        String html = read("register.html");
        assertThat(html).contains("autocomplete=\"username\"")
                .contains("autocomplete=\"email\"");
        assertThat(html.split("autocomplete=\"new-password\"", -1).length - 1)
                .as("mot de passe + confirmation").isEqualTo(2);
        assertThat(read("login.html")).contains("autocomplete=\"current-password\"");
    }

    @Test
    void everyPasswordRevealButtonIsNamed() throws IOException {
        String html = read("register.html");
        assertThat(html.split("toggle-password-btn", -1).length - 1)
                .isEqualTo(html.split("aria-label=\"Afficher le mot de passe\"", -1).length - 1);
    }
}
