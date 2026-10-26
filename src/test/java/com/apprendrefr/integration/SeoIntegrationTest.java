package com.apprendrefr.integration;

import com.apprendrefr.controller.SeoController;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class SeoIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    static List<String> pages() {
        return SeoController.publicPages();
    }

    @Test
    void robots_isPublicAndPointsToSitemap() throws Exception {
        mockMvc.perform(get("/robots.txt"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Disallow: /admin/")))
                .andExpect(content().string(containsString("/sitemap.xml")));
    }

    @Test
    void googleVerificationFile_isPublic() throws Exception {
        mockMvc.perform(get("/googleb831499c732fc7f6.html"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("google-site-verification: googleb831499c732fc7f6.html")));
    }

    @Test
    void bingVerificationFile_isPublicXml() throws Exception {
        mockMvc.perform(get("/BingSiteAuth.xml"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("DC557EF4AEAE21F9C130F045641572CE")));
    }

    @Test
    void sitemap_isPublicXml() throws Exception {
        mockMvc.perform(get("/sitemap.xml"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("<urlset")))
                .andExpect(content().string(containsString("/supports-de-cours</loc>")))
                // adresses avec accent : encodées (/lesPrépositions -> /lesPr%C3%A9positions)
                .andExpect(content().string(containsString("/lesPr%C3%A9positions</loc>")))
                .andExpect(content().string(containsString("/negationApprofondie</loc>")));
    }

    /** Chaque page du sitemap doit répondre 200 sans être connecté, sinon le sitemap est faux. */
    @ParameterizedTest
    @MethodSource("pages")
    void everySitemapPage_isPublic(String path) throws Exception {
        mockMvc.perform(get(path)).andExpect(status().isOk());
    }

    @Test
    void aboutPage_hasDescriptionAndSuffixedTitle() throws Exception {
        mockMvc.perform(get("/about"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("name=\"description\"")))
                .andExpect(content().string(containsString("| Français pour débutants")));
    }
}
