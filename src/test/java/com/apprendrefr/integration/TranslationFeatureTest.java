package com.apprendrefr.integration;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.entity.Theme;
import com.apprendrefr.entity.Translation;
import com.apprendrefr.entity.Vocabulary;
import com.apprendrefr.repository.LessonRepository;
import com.apprendrefr.repository.ThemeRepository;
import com.apprendrefr.repository.TranslationRepository;
import com.apprendrefr.repository.VocabularyRepository;
import com.apprendrefr.util.TranslationLang;
import jakarta.servlet.http.Cookie;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Traductions des leçons : choix de la langue mémorisé, affichage , texte toujours échappé. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class TranslationFeatureTest {

    @Autowired private MockMvc mockMvc;
    @Autowired private ThemeRepository themeRepository;
    @Autowired private LessonRepository lessonRepository;
    @Autowired private VocabularyRepository vocabularyRepository;
    @Autowired private TranslationRepository translationRepository;

    private Long themeId;
    private Long lessonId;
    private Long vocabId;

    @BeforeEach
    void setUp() {
        Theme theme = new Theme();
        theme.setNom("theme_traduction_test");
        theme.setTitle("Au café (test)");
        theme.setDialogueContent("Serveur : Bonjour !");
        themeId = themeRepository.save(theme).getId();
        translationRepository.save(new Translation(Translation.THEME_DIALOGUE, themeId, "es", "Camarero: ¡Hola! <b>x</b>", false));
        translationRepository.save(new Translation(Translation.THEME_DIALOGUE, themeId, "pt", "Garçom: Olá!", true));

        Lesson lesson = new Lesson();
        lesson.setTitle("Les fruits (test)");
        lesson.setLevel("A1");
        lessonId = lessonRepository.save(lesson).getId();
        Vocabulary v = new Vocabulary();
        v.setFrenchWord("POMME");
        v.setEnglishTranslation("an apple");
        v.setExampleSentence("Je mange une pomme.");
        v.setLesson(lesson);
        vocabId = vocabularyRepository.save(v).getId();
        translationRepository.save(new Translation(Translation.VOCAB_WORD, vocabId, "pt", "maçã", false));
        translationRepository.save(new Translation(Translation.VOCAB_SENTENCE, vocabId, "pt", "Eu como uma maçã.", false));
    }

    @AfterEach
    void cleanUp() {
        translationRepository.deleteAll();
        vocabularyRepository.deleteById(vocabId);
        lessonRepository.deleteById(lessonId);
        themeRepository.deleteById(themeId);
    }

    @Test
    void chosenLanguageIsShown_andRememberedInACookie() throws Exception {
        mockMvc.perform(get("/themes/theme_traduction_test").param("lang", "es"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Camarero: ¡Hola!")))
                .andExpect(content().string(containsString("dir=\"ltr\"")))
                .andExpect(content().string(containsString("Traduction automatique, non relue")))
                .andExpect(header().string("Set-Cookie", containsString("ffb_lang=es")));
    }

    @Test
    void translationTextIsEscaped() throws Exception {
        mockMvc.perform(get("/themes/theme_traduction_test").param("lang", "es"))
                .andExpect(content().string(containsString("&lt;b&gt;x&lt;/b&gt;")))
                .andExpect(content().string(not(containsString("<b>x</b>"))));
    }

    @Test
    void cookieKeepsTheLanguage_andAReviewedTranslationSaysSo() throws Exception {
        mockMvc.perform(get("/themes/theme_traduction_test").cookie(new Cookie("ffb_lang", "pt")))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Garçom: Olá!")))
                .andExpect(content().string(containsString("Traduction relue par un bénévole")));
    }

    @Test
    void frenchChoiceClearsTheCookie_andShowsNoTranslation() throws Exception {
        mockMvc.perform(get("/themes/theme_traduction_test").param("lang", "fr").cookie(new Cookie("ffb_lang", "es")))
                .andExpect(status().isOk())
                .andExpect(content().string(not(containsString("Camarero"))))
                .andExpect(header().string("Set-Cookie", containsString("Max-Age=0")));
    }

    @Test
    void unknownLanguageIsNeverEchoedBack() throws Exception {
        mockMvc.perform(get("/themes/theme_traduction_test").param("lang", "\"><script>alert(1)</script>"))
                .andExpect(status().isOk())
                .andExpect(content().string(not(containsString("alert(1)"))));
        assertThat(TranslationLang.of("xx")).isEmpty();
        assertThat(TranslationLang.of("es")).contains(TranslationLang.ES);
        assertThat(TranslationLang.ES.isRtl()).isFalse();
    }

    @Test
    void missingTranslationShowsAFriendlyMessage() throws Exception {
        mockMvc.perform(get("/themes/theme_traduction_test").param("lang", "ko"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Pas encore de traduction de ce dialogue")));
    }

    @Test
    void vocabularyPageShowsTheWordAndSentenceTranslations() throws Exception {
        mockMvc.perform(get("/lesson/" + lessonId + "/vocabulary").param("lang", "pt"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("maçã")))
                .andExpect(content().string(containsString("Eu como uma maçã.")))
                .andExpect(content().string(containsString("Traduction automatique, non relue")));
    }
}
