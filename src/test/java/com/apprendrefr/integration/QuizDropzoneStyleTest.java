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
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Quiz à trous (glisser-déposer) : un seul style partagé, cases de 46 px, une phrase par ligne. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class QuizDropzoneStyleTest {

    private static final Path RESOURCES = Path.of("src/main/resources");

    @Autowired
    private MockMvc mockMvc;

    @Test
    void sharedStyle_isServed_withComfortableSizes() throws Exception {
        mockMvc.perform(get("/css/quiz-dropzone.css"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("white-space: pre-line")))   // une phrase par ligne
                .andExpect(content().string(containsString("min-height: 46px")))        // cases et mots faciles à toucher
                .andExpect(content().string(containsString(".dropzone.correct::after")))
                .andExpect(content().string(containsString(".dropzone.incorrect::after")));
    }

    @Test
    void everyQuizPage_usesTheSharedStyle_andNoDuplicateRemains() throws IOException {
        assertThat(RESOURCES.resolve("static/css/quiz-dropzone-basic.css")).doesNotExist();
        assertThat(RESOURCES.resolve("static/css/theme-detail-dropzone.css")).doesNotExist();
        try (Stream<Path> s = Files.walk(RESOURCES.resolve("templates"))) {
            for (Path p : s.filter(f -> f.toString().endsWith(".html")).toList()) {
                String html = Files.readString(p);
                assertThat(html).as(p.toString())
                        .doesNotContain("quiz-dropzone-basic.css")
                        .doesNotContain("theme-detail-dropzone.css");
                if (html.contains("class=\"quiz-wrapper") || html.contains("dragAndDrop.js")
                        || html.contains("scriptQuizGrammaire.js")) {
                    assertThat(html).as("%s doit charger le style partagé", p)
                            .contains("/css/quiz-dropzone.css");
                }
            }
        }
    }

    @Test
    void quizScripts_markResultsWithClasses_notInlineColors() throws IOException {
        for (String f : new String[]{"static/js/dragAndDrop.js", "static/js/scriptQuizGrammaire.js"}) {
            String js = Files.readString(RESOURCES.resolve(f));
            assertThat(js).as(f).contains("classList.add('correct')").contains("classList.add('incorrect')");
            assertThat(js).as(f).doesNotContain("style.backgroundColor");
        }
    }
}
