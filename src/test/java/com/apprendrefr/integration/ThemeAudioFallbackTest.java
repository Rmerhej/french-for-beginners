package com.apprendrefr.integration;

import com.apprendrefr.entity.Theme;
import com.apprendrefr.repository.ThemeRepository;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Un thème sans fichier MP3 se lit avec la voix du navigateur ; un thème avec MP3 garde son lecteur audio. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ThemeAudioFallbackTest {

    @Autowired private MockMvc mockMvc;
    @Autowired private ThemeRepository themeRepository;

    private Long withoutAudioId;
    private Long withAudioId;

    @BeforeEach
    void setUp() {
        Theme a = new Theme();
        a.setNom("theme_sans_mp3_test");
        a.setTitle("Dans la cuisine (test)");
        a.setDialogueContent("Chef : Bonjour Léa.\r\n\r\nLéa : Bonjour chef.");
        withoutAudioId = themeRepository.save(a).getId();

        Theme b = new Theme();
        b.setNom("theme_avec_mp3_test");
        b.setTitle("Au café (test)");
        b.setDialogueContent("Serveur : Bonjour !");
        b.setAudio("/uploads/audio/test.mp3");
        withAudioId = themeRepository.save(b).getId();
    }

    @AfterEach
    void cleanUp() {
        themeRepository.deleteById(withoutAudioId);
        themeRepository.deleteById(withAudioId);
    }

    @Test
    void themeWithoutMp3UsesTheBrowserVoice() throws Exception {
        mockMvc.perform(get("/themes/theme_sans_mp3_test"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("btn-say")))
                .andExpect(content().string(containsString("data-lines")))
                .andExpect(content().string(containsString("Écouter le dialogue")))
                .andExpect(content().string(not(containsString("btn-play"))));
    }

    @Test
    void themeWithMp3KeepsItsAudioPlayer() throws Exception {
        mockMvc.perform(get("/themes/theme_avec_mp3_test"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("btn-play")))
                .andExpect(content().string(containsString("/uploads/audio/test.mp3")))
                .andExpect(content().string(not(containsString("btn-say"))));
    }
}
