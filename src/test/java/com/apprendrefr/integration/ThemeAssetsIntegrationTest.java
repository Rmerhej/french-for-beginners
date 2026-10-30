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
import java.util.List;
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * Thème du site : la police est hébergée sur le site (aucune requête vers Google),
 * le fichier de thème est chargé après Bootstrap et reste accessible sans compte.
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ThemeAssetsIntegrationTest {

    private static final Path RESOURCES = Path.of("src/main/resources");

    @Autowired
    private MockMvc mockMvc;

    @Test
    void themeCss_isPublic_andDeclaresTheLocalFont() throws Exception {
        mockMvc.perform(get("/css/theme.css"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Plus Jakarta Sans")))
                .andExpect(content().string(containsString("--ffb-primary")))
                .andExpect(content().string(containsString("PlusJakartaSans-wght.woff2")));
    }

    @Test
    void font_isPublic_andIsARealWoff2File() throws Exception {
        byte[] bytes = mockMvc.perform(get("/fonts/PlusJakartaSans-wght.woff2"))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsByteArray();
        assertThat(bytes.length).isGreaterThan(10_000);
        assertThat(new String(bytes, 0, 4, java.nio.charset.StandardCharsets.US_ASCII)).isEqualTo("wOF2");
    }

    @Test
    void fontLicense_isShippedWithTheFont() {
        assertThat(RESOURCES.resolve("static/fonts/OFL.txt")).exists();
    }

    @Test
    void themeFontPath_pointsToAnExistingFile() throws IOException {
        // theme.css est servi sous /css/ : « ../fonts/... » doit donc retomber sur /fonts/...
        String css = Files.readString(RESOURCES.resolve("static/css/theme.css"));
        assertThat(css).contains("url(\"../fonts/PlusJakartaSans-wght.woff2\")");
        assertThat(RESOURCES.resolve("static/fonts/PlusJakartaSans-wght.woff2")).exists();
    }

    @Test
    void pages_loadTheThemeAfterBootstrap() throws Exception {
        String html = mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();
        int bootstrap = html.indexOf("bootstrap.min.css");
        int theme = html.indexOf("/css/theme.css");
        assertThat(bootstrap).isGreaterThanOrEqualTo(0);
        assertThat(theme).as("theme.css doit être chargé").isGreaterThan(bootstrap);
        assertThat(html).contains("/fonts/PlusJakartaSans-wght.woff2");
    }

    @Test
    void serviceWorker_cachesTheFonts() throws Exception {
        mockMvc.perform(get("/sw.js"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("'/fonts/'")));
    }

    @Test
    void noPageOrStyle_callsGoogleFonts() throws IOException {
        List<Path> files;
        try (Stream<Path> s = Files.walk(RESOURCES)) {
            files = s.filter(p -> p.toString().endsWith(".html") || p.toString().endsWith(".css")).toList();
        }
        for (Path p : files) {
            assertThat(Files.readString(p))
                    .as("Google Fonts dans %s : la police doit rester hébergée sur le site (RGPD)", p)
                    .doesNotContain("fonts.googleapis.com")
                    .doesNotContain("fonts.gstatic.com");
        }
    }

    @Test
    void pages_doNotForceAnotherFontFamily() throws IOException {
        try (Stream<Path> s = Files.walk(RESOURCES.resolve("static/css"))) {
            for (Path p : s.filter(f -> f.toString().endsWith(".css")).toList()) {
                if (p.endsWith("theme.css")) continue;
                assertThat(Files.readString(p))
                        .as("« Segoe UI » dans %s : la police vient de theme.css", p)
                        .doesNotContain("Segoe UI");
            }
        }
    }
}
