package com.apprendrefr.service;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.User;
import com.apprendrefr.entity.UserExerciseScore;
import com.apprendrefr.repository.ExerciseRepository;
import com.apprendrefr.repository.UserExerciseScoreRepository;
import com.apprendrefr.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

/**
 * Enregistre les réponses aux QCM et prépare les résultats d'un utilisateur.
 * La correction est faite ICI, côté serveur : on ne fait pas confiance au navigateur.
 */
@Service
public class ExerciseScoreService {

    public record SubmitResult(boolean correct, String correctAnswer) {
    }

    public record LessonRow(String lesson, long answered, long correct, int percent) {
    }

    public record RecentRow(String lesson, String question, boolean correct, LocalDateTime when) {
    }

    public record MyResults(long answered, long correct, int percent,
                            List<LessonRow> lessons, List<RecentRow> recent) {
    }

    private final UserExerciseScoreRepository scoreRepository;
    private final UserRepository userRepository;
    private final ExerciseRepository exerciseRepository;

    public ExerciseScoreService(UserExerciseScoreRepository scoreRepository,
                                UserRepository userRepository,
                                ExerciseRepository exerciseRepository) {
        this.scoreRepository = scoreRepository;
        this.userRepository = userRepository;
        this.exerciseRepository = exerciseRepository;
    }

    /** @return vide si l'utilisateur ou l'exercice n'existe pas */
    @Transactional
    public Optional<SubmitResult> submit(String username, Long exerciseId, String userAnswer) {
        Optional<User> user = userRepository.findByUsername(username);
        Optional<Exercise> exercise = exerciseRepository.findById(exerciseId);
        if (user.isEmpty() || exercise.isEmpty()) {
            return Optional.empty();
        }

        boolean correct = isCorrect(exercise.get(), userAnswer);
        scoreRepository.save(new UserExerciseScore(user.get(), exercise.get(), correct ? 1 : 0));

        return Optional.of(new SubmitResult(correct, answerText(exercise.get(), exercise.get().getCorrectAnswer())));
    }

    @Transactional(readOnly = true)
    public List<Long> successfulExerciseIds(String username) {
        return userId(username).map(scoreRepository::findSuccessfulExerciseIds).orElse(List.of());
    }

    @Transactional(readOnly = true)
    public List<Long> attemptedExerciseIds(String username) {
        return userId(username).map(scoreRepository::findAttemptedExerciseIds).orElse(List.of());
    }

    @Transactional(readOnly = true)
    public MyResults myResults(String username) {
        Optional<Long> userId = userId(username);
        if (userId.isEmpty()) {
            return new MyResults(0, 0, 0, List.of(), List.of());
        }
        Long id = userId.get();
        long answered = scoreRepository.countByUserId(id);
        long correct = scoreRepository.countByUserIdAndScore(id, 1);

        List<LessonRow> lessons = new ArrayList<>();
        for (Object[] row : scoreRepository.summaryByLesson(id)) {
            String title = row[0] == null || String.valueOf(row[0]).isBlank() ? "Sans titre" : String.valueOf(row[0]);
            long n = ((Number) row[1]).longValue();
            long ok = row[2] == null ? 0 : ((Number) row[2]).longValue();
            lessons.add(new LessonRow(title, n, ok, percent(ok, n)));
        }

        List<RecentRow> recent = new ArrayList<>();
        for (UserExerciseScore s : scoreRepository.findTop10ByUserIdOrderByCompletedAtDesc(id)) {
            Exercise e = s.getExercise();
            recent.add(new RecentRow(e.getLessonTitle(), e.getQuestion(), s.getScore() > 0, s.getCompletedAt()));
        }
        return new MyResults(answered, correct, percent(correct, answered), lessons, recent);
    }

    private Optional<Long> userId(String username) {
        return userRepository.findByUsername(username).map(User::getId);
    }

    private static int percent(long part, long total) {
        return total == 0 ? 0 : (int) Math.round(part * 100.0 / total);
    }

    // ------------------------------------------------------------------
    // Correction
    // ------------------------------------------------------------------

    /**
     * La bonne réponse enregistrée peut être une lettre (A à D) ou le texte de l'option,
     * et le navigateur peut envoyer l'un ou l'autre. On compare donc les TEXTES des options.
     */
    public static boolean isCorrect(Exercise exercise, String userAnswer) {
        String correct = normalize(answerText(exercise, exercise.getCorrectAnswer()));
        String given = normalize(answerText(exercise, userAnswer));
        return !correct.isEmpty() && correct.equals(given);
    }

    static String answerText(Exercise exercise, String answer) {
        if (answer == null) {
            return "";
        }
        String trimmed = answer.trim();
        String[] options = {exercise.getOptionA(), exercise.getOptionB(), exercise.getOptionC(), exercise.getOptionD()};

        // Si le texte correspond déjà à une option, on le garde tel quel.
        for (String option : options) {
            if (option != null && normalize(option).equals(normalize(trimmed))) {
                return trimmed;
            }
        }
        // Sinon, une lettre seule désigne l'option correspondante.
        if (trimmed.length() == 1) {
            int index = "ABCD".indexOf(Character.toUpperCase(trimmed.charAt(0)));
            if (index >= 0 && options[index] != null) {
                return options[index];
            }
        }
        return trimmed;
    }

    static String normalize(String text) {
        if (text == null) {
            return "";
        }
        return text.trim().replaceAll("\\s+", " ").toLowerCase(Locale.ROOT);
    }
}
