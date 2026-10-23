package com.apprendrefr.service;

import com.apprendrefr.entity.Quiz;
import com.apprendrefr.entity.User;
import com.apprendrefr.entity.UserQuizScore;
import com.apprendrefr.repository.QuizRepository;
import com.apprendrefr.repository.UserQuizScoreRepository;
import com.apprendrefr.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

/** Scores des quiz glisser-déposer et progression par étape du parcours. */
@Service
public class QuizScoreService {

    public record SubmitResult(int score, int total) {
    }

    /** done = quiz réussis à 100 %, total = quiz de l'étape. */
    public record Progress(int done, int total) {
        public boolean complete() {
            return total > 0 && done >= total;
        }
    }

    public record QuizRecent(String title, int score, int total, java.time.LocalDateTime when) {
        public boolean perfect() {
            return total > 0 && score == total;
        }
    }

    public record QuizSummary(long attempts, int attemptedQuizzes, int perfectQuizzes, List<QuizRecent> recent) {
    }

    private final UserQuizScoreRepository scoreRepository;
    private final UserRepository userRepository;
    private final QuizRepository quizRepository;

    public QuizScoreService(UserQuizScoreRepository scoreRepository, UserRepository userRepository,
                            QuizRepository quizRepository) {
        this.scoreRepository = scoreRepository;
        this.userRepository = userRepository;
        this.quizRepository = quizRepository;
    }

    /** Correction côté serveur : answers = réponses données, dans l'ordre des zones. */
    @Transactional
    public Optional<SubmitResult> submit(String username, Long quizId, List<String> answers) {
        Optional<User> user = userRepository.findByUsername(username);
        Optional<Quiz> quiz = quizRepository.findById(quizId);
        if (user.isEmpty() || quiz.isEmpty()) {
            return Optional.empty();
        }
        SubmitResult result = grade(quiz.get().getCorrectAnswers(), answers);
        scoreRepository.save(new UserQuizScore(user.get(), quiz.get(), result.score(), result.total()));
        return Optional.of(result);
    }

    static SubmitResult grade(String correctAnswers, List<String> answers) {
        if (correctAnswers == null || correctAnswers.isBlank()) {
            return new SubmitResult(0, 0);
        }
        String[] expected = correctAnswers.split(",");
        int score = 0;
        for (int i = 0; i < expected.length; i++) {
            String given = i < answers.size() ? answers.get(i) : "";
            if (given != null && !given.isBlank() && given.trim().equals(expected[i].trim())) {
                score++;
            }
        }
        return new SubmitResult(score, expected.length);
    }

    /** Résumé pour la page « Mes résultats ». */
    @Transactional(readOnly = true)
    public QuizSummary summary(String username) {
        Optional<User> user = userRepository.findByUsername(username);
        if (user.isEmpty()) {
            return new QuizSummary(0, 0, 0, List.of());
        }
        Long id = user.get().getId();
        List<QuizRecent> recent = new java.util.ArrayList<>();
        for (UserQuizScore s : scoreRepository.findTop10ByUserIdOrderByCompletedAtDesc(id)) {
            recent.add(new QuizRecent(s.getQuiz().getTitle(), s.getScore(), s.getTotal(), s.getCompletedAt()));
        }
        return new QuizSummary(scoreRepository.countByUserId(id),
                scoreRepository.findAttemptedQuizIds(id).size(),
                scoreRepository.findPerfectQuizIds(id).size(), recent);
    }

    /** Minuscules, sans accents, apostrophes simplifiées : même idée que la recherche MySQL de la page quiz. */
    static String fold(String text) {
        if (text == null) {
            return "";
        }
        String decomposed = java.text.Normalizer.normalize(text, java.text.Normalizer.Form.NFD);
        return decomposed.replaceAll("\\p{M}+", "").replace('\u2019', '\'').toLowerCase(Locale.ROOT);
    }

    @Transactional(readOnly = true)
    public List<Long> perfectQuizIds(String username) {
        return userRepository.findByUsername(username).map(u -> scoreRepository.findPerfectQuizIds(u.getId())).orElse(List.of());
    }

    @Transactional(readOnly = true)
    public List<Long> attemptedQuizIds(String username) {
        return userRepository.findByUsername(username).map(u -> scoreRepository.findAttemptedQuizIds(u.getId())).orElse(List.of());
    }

    /**
     * Progression par titre de quiz. Un quiz « correspond » à un titre comme sur la page
     * /quiz/drag-drop : le titre du quiz contient le texte recherché (sans tenir compte de la casse).
     */
    @Transactional(readOnly = true)
    public Map<String, Progress> progressByTitle(String username, Collection<String> titles) {
        Map<String, Progress> map = new LinkedHashMap<>();
        if (username == null) {
            return map;
        }
        Set<Long> perfect = new HashSet<>(perfectQuizIds(username));
        List<Object[]> all = quizRepository.findAllIdAndTitle();
        for (String wanted : titles) {
            String needle = fold(wanted);
            int total = 0;
            int done = 0;
            for (Object[] row : all) {
                String title = fold(row[1] == null ? "" : String.valueOf(row[1]));
                if (title.contains(needle)) {
                    total++;
                    if (perfect.contains(((Number) row[0]).longValue())) {
                        done++;
                    }
                }
            }
            map.put(wanted, new Progress(done, total));
        }
        return map;
    }
}
