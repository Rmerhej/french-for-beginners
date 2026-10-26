package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.nio.file.Files;
import java.nio.file.Path;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class StaticCacheIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Value("${app.upload.dir}")
    private String uploadDir;

    @Test
    void appScripts_mustBeRevalidated() throws Exception {
        mockMvc.perform(get("/js/score-sender.js"))
                .andExpect(status().isOk())
                .andExpect(header().string("Cache-Control", containsString("no-cache")));
    }

    @Test
    void serviceWorker_mustBeRevalidated() throws Exception {
        mockMvc.perform(get("/sw.js"))
                .andExpect(status().isOk())
                .andExpect(header().string("Cache-Control", containsString("no-cache")));
    }

    /** Images et audio : revérifiés à chaque fois (304 léger), jamais « no-store » qui obligerait à tout retélécharger. */
    @Test
    void uploadedFiles_mustBeRevalidated_notBlocked() throws Exception {
        Path dir = Path.of(uploadDir);
        Files.createDirectories(dir);
        Path file = dir.resolve("cache-control-test.txt");
        Files.writeString(file, "test");
        try {
            mockMvc.perform(get("/uploads/cache-control-test.txt"))
                    .andExpect(status().isOk())
                    .andExpect(header().string("Cache-Control", containsString("no-cache")))
                    .andExpect(header().string("Cache-Control", not(containsString("no-store"))));
        } finally {
            Files.deleteIfExists(file);
        }
    }
}
