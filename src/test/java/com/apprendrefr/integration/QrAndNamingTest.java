package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Page « QR code du site » (publique, imprimable) et nom « Leçons de vocabulaire » pour la page /lessons. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class QrAndNamingTest {

    private static final Path RESOURCES = Path.of("src/main/resources");

    @Autowired
    private MockMvc mockMvc;

    private static String read(String file) throws IOException {
        return Files.readString(RESOURCES.resolve(file));
    }

    @Test
    void qrPageIsPublic_withPrintAndDownload() throws Exception {
        mockMvc.perform(get("/qr"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("<h1>QR code du site</h1>")))
                .andExpect(content().string(containsString("/images/qr-french-for-beginners.svg")))
                .andExpect(content().string(containsString("/images/qr-french-for-beginners.png")))
                .andExpect(content().string(containsString("data-click=\"printPage\"")));
    }

    @Test
    void qrFilesExist_andPointToTheSite() throws IOException {
        assertThat(RESOURCES.resolve("static/images/qr-french-for-beginners.png")).exists();
        assertThat(read("static/images/qr-french-for-beginners.svg"))
                .contains("https://frenchforbeginners.duckdns.org/").contains("viewBox");
    }

    @Test
    void printActionIsAllowedAndDefined() throws IOException {
        assertThat(read("static/js/events.js")).contains("'printPage'");
        assertThat(read("static/js/print-page.js")).contains("window.printPage").contains("window.print()");
    }

    @Test
    void footerSitePlanAndSitemapLinkToTheQrPage() throws Exception {
        mockMvc.perform(get("/contact")).andExpect(content().string(containsString("href=\"/qr\"")));
        mockMvc.perform(get("/plan-du-site")).andExpect(content().string(containsString("href=\"/qr\"")));
        mockMvc.perform(get("/sitemap.xml")).andExpect(content().string(containsString("/qr</loc>")));
    }

    @Test
    void lessonsPageIsCalledVocabularyLessons() throws Exception {
        assertThat(read("templates/fragments/navbar.html")).contains("Leçons de vocabulaire");
        assertThat(read("templates/lessons.html")).contains("Leçons de vocabulaire").doesNotContain("Toutes les Leçons");
        mockMvc.perform(get("/plan-du-site"))
                .andExpect(content().string(containsString("Leçons de vocabulaire")));
    }
}
