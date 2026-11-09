package com.apprendrefr.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Page « Les lettres et les nombres » : les cinq écoutes passent par la voix de l'appareil, avec l'audio enregistré en secours. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ReadAloudNumbersLettersTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void allFiveListeningButtonsUseTheDeviceVoice_withRecordingsAsFallback() throws Exception {
        mockMvc.perform(get("/chiffresEtLettres"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("/js/say.js")))
                .andExpect(content().string(containsString("data-say=\"a, bé, cé")))
                .andExpect(content().string(containsString("data-say=\"a, euh, i, o, u, i grec\"")))
                .andExpect(content().string(containsString("data-say=\"é; café;")))
                .andExpect(content().string(containsString("data-say=\"zéro, un, deux")))
                .andExpect(content().string(containsString("data-say=\"trente, quarante")))
                .andExpect(content().string(containsString("/uploads/audio/Alphabet.mp3")))
                .andExpect(content().string(containsString("/uploads/audio/Dizaines.mp3")));
    }
}
