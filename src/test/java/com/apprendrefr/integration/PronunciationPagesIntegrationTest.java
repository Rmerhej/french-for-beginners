package com.apprendrefr.integration;

import com.apprendrefr.entity.Prononciation;
import com.apprendrefr.repository.PrononciationRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
class PronunciationPagesIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private PrononciationRepository repository;

    @Test
    void minimalPairsPage_isPublicAndHasPairs() throws Exception {
        mockMvc.perform(get("/paires-minimales"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("data-words=")))
                .andExpect(content().string(containsString("/js/say.js")))
                .andExpect(content().string(containsString("/js/paires-minimales.js")));
    }

    @Test
    void liaisonPage_isPublicAndHasContent() throws Exception {
        mockMvc.perform(get("/liaison-lettres-muettes"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("CaReFuL")))
                .andExpect(content().string(containsString("btn-say")))
                .andExpect(content().string(containsString("/js/say.js")));
    }

    @Test
    void pronunciationPage_linksToBothNewPages() throws Exception {
        mockMvc.perform(get("/prononciation"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("/paires-minimales")))
                .andExpect(content().string(containsString("/liaison-lettres-muettes")));
    }

    @Test
    void cardWithoutAudio_showsVoiceButton() throws Exception {
        repository.save(new Prononciation("zz-test-sans-audio", "mot-sans-audio", null));
        mockMvc.perform(get("/prononciation"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("btn-say")))
                .andExpect(content().string(containsString("mot-sans-audio")));
    }

    @Test
    void cardWithAudio_showsRecordedPlayer() throws Exception {
        repository.save(new Prononciation("zz-test-avec-audio", "mot-avec-audio", "/audio/test.mp3"));
        mockMvc.perform(get("/prononciation"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("btn-play")))
                .andExpect(content().string(containsString("/audio/test.mp3")));
    }
}
