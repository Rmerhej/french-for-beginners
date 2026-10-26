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
 * Garde-fous : le CDN Bootstrap n'est écrit qu'à un seul endroit (fragments/assets.html)
 * et les pages n'embarquent plus de bloc <style> (les styles sont dans static/css).
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class TemplateAssetsTest {

    private static final Path TEMPLATES = Path.of("src/main/resources/templates");

    @Autowired
    private MockMvc mockMvc;

    private static List<Path> templates() throws IOException {
        try (Stream<Path> s = Files.walk(TEMPLATES)) {
            return s.filter(p -> p.toString().endsWith(".html")).toList();
        }
    }

    @Test
    void bootstrapCdn_isDeclaredOnlyInAssetsFragment() throws IOException {
        for (Path p : templates()) {
            if (p.endsWith("fragments/assets.html")) continue;
            assertThat(Files.readString(p))
                    .as("CDN Bootstrap en dur dans %s : utiliser fragments/assets", p)
                    .doesNotContain("cdn.jsdelivr.net/npm/bootstrap");
        }
    }

    @Test
    void pages_haveNoInlineStyleBlock_exceptGlobalFooter() throws IOException {
        for (Path p : templates()) {
            if (p.endsWith("fragments/footer.html")) continue;
            assertThat(Files.readString(p))
                    .as("Bloc <style> dans %s : déplacer dans static/css", p)
                    .doesNotContain("<style");
        }
    }

    @Test
    void lessonPage_rendersBootstrapAndPageCss() throws Exception {
        mockMvc.perform(get("/lesRepas"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("bootstrap@5.3.3/dist/css/bootstrap.min.css")))
                .andExpect(content().string(containsString("bootstrap-icons@1.11.3")))
                .andExpect(content().string(containsString("/css/lesson-header-orange.css")))
                .andExpect(content().string(containsString("bootstrap.bundle.min.js")));
    }
}
