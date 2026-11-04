package com.apprendrefr.integration;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.Quiz;
import com.apprendrefr.repository.ExerciseRepository;
import com.apprendrefr.repository.QuizRepository;
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

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
class ExamenCiviqueIntegrationTest {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private ExerciseRepository exerciseRepository;
    @Autowired
    private QuizRepository quizRepository;

    private Exercise exercise(String lessonTitle, String question) {
        Exercise ex = new Exercise();
        ex.setLessonTitle(lessonTitle);
        ex.setQuestion(question);
        ex.setOptionA("Option A");
        ex.setOptionB("Option B");
        ex.setOptionC("Option C");
        ex.setOptionD("Option D");
        ex.setCorrectAnswer("B");
        ex.setExplanation("Parce que.");
        ex.setExerciseType("QCM");
        return exerciseRepository.save(ex);
    }

    private Quiz quiz(String title, String sentence) {
        Quiz q = new Quiz();
        q.setTitle(title);
        q.setSentence(sentence);
        q.setWords("un,deux,trois");
        q.setCorrectAnswers("un");
        q.setImageUrl("");
        return quizRepository.save(q);
    }

    @Test
    void generalPagesArePublicAndExplainTheRealExam() throws Exception {
        mockMvc.perform(get("/examenCiviqueQCM"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("QCM général")))
                .andExpect(content().string(containsString("40 questions")))
                .andExpect(content().string(containsString("32 bonnes réponses")));
        mockMvc.perform(get("/examenCiviqueQUIZ"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Quiz général")));
    }

    @Test
    void qcmShowsOnlyTheGeneralQuestions_andNumbersThem() throws Exception {
        exercise("Examen civique - QCM général", "Question générale ?");
        exercise("Droits et devoirs", "Question du module trois ?");

        mockMvc.perform(get("/examenCiviqueQCM"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Question générale ?")))
                .andExpect(content().string(containsString("Question 1 / 1")))
                .andExpect(content().string(not(containsString("Question du module trois ?"))));
    }

    @Test
    void generalQuestionsDoNotLeakIntoTheFiveModules() throws Exception {
        exercise("Examen civique - QCM général", "Question générale ?");
        quiz("Examen civique - Quiz général", "Phrase générale ____.");

        for (String page : new String[]{"/principesEtValeursQCM", "/systemeInstEtPolitiqueQCM", "/droitsEtDevoirsQCM",
                "/histoireGeoCultureQCM", "/vivreDsSocieteFQCM", "/principesEtValeursQUIZ", "/systemeInstEtPolitiqueQUIZ",
                "/droitsEtDevoirsQUIZ", "/histoireGeoCultureQUIZ", "/vivreDsSocieteFQUIZ"}) {
            mockMvc.perform(get(page))
                    .andExpect(status().isOk())
                    .andExpect(content().string(not(containsString("Question générale ?"))))
                    .andExpect(content().string(not(containsString("Phrase générale"))));
        }
    }

    @Test
    void quizShowsOnlyTheGeneralSentences() throws Exception {
        quiz("Examen civique - Quiz général", "Phrase générale ____.");
        quiz("Droits et devoirs - Module", "Phrase du module ____.");

        mockMvc.perform(get("/examenCiviqueQUIZ"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Phrase générale")))
                .andExpect(content().string(not(containsString("Phrase du module"))));
    }

    @Test
    void indexAndSitePlanLinkToTheGeneralPages() throws Exception {
        mockMvc.perform(get("/laFrance"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("/examenCiviqueQCM")))
                .andExpect(content().string(containsString("/examenCiviqueQUIZ")));
        mockMvc.perform(get("/plan-du-site"))
                .andExpect(content().string(containsString("/examenCiviqueQCM")))
                .andExpect(content().string(containsString("/examenCiviqueQUIZ")));
    }
}
