package com.apprendrefr.integration;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.repository.LessonRepository;
import com.apprendrefr.repository.VocabularyRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Un mot sans fichier audio reçoit un bouton « Écouter » (voix du navigateur) ; un mot avec audio garde son lecteur. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
class VocabularyTtsIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private LessonRepository lessonRepository;

    @Autowired
    private VocabularyRepository vocabularyRepository;

    private Lesson lesson() {
        Lesson lesson = new Lesson();
        lesson.setTitle("Test voix");
        lesson.setLevel("A1");
        return lessonRepository.save(lesson);
    }

    private void word(Lesson lesson, String french, String audioUrl) {
        Vocabulary v = new Vocabulary();
        v.setFrenchWord(french);
        v.setEnglishTranslation("test");
        v.setAudioUrl(audioUrl);
        v.setLesson(lesson);
        vocabularyRepository.save(v);
    }

    @Test
    void wordWithoutAudio_getsBrowserVoiceButton() throws Exception {
        Lesson lesson = lesson();
        word(lesson, "chaise", null);

        mockMvc.perform(get("/lesson/{id}/vocabulary", lesson.getId()))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("btn-tts")))
                .andExpect(content().string(containsString("data-word=\"chaise\"")));
    }

    @Test
    void wordWithAudio_keepsItsPlayer_withoutBrowserVoiceButton() throws Exception {
        Lesson lesson = lesson();
        word(lesson, "table", "/uploads/audio/table.mp3");

        mockMvc.perform(get("/lesson/{id}/vocabulary", lesson.getId()))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("btn-play")))
                .andExpect(content().string(not(containsString("btn-tts"))));
    }
}
