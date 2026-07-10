package com.apprendrefr.service;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.entity.User;
import com.apprendrefr.entity.UserExerciseScore;
import com.apprendrefr.repository.UserExerciseScoreRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class ScoreService {

    private final UserExerciseScoreRepository scoreRepository;

    public ScoreService(UserExerciseScoreRepository scoreRepository) {
        this.scoreRepository = scoreRepository;
    }

    @Transactional
    public void saveScore(User user, Exercise exercise, int points) {
        Optional<UserExerciseScore> existingScore = scoreRepository.findByUserIdAndExerciseId(user.getId(), exercise.getId());

        if (existingScore.isPresent()) {
            UserExerciseScore userScore = existingScore.get();
            if (points > userScore.getScore()) {
                userScore.setScore(points);
                userScore.setCompletedAt(LocalDateTime.now());
                scoreRepository.save(userScore);
            }
        } else {
            UserExerciseScore newScore = new UserExerciseScore();
            newScore.setUser(user);
            newScore.setExercise(exercise);
            newScore.setScore(points);
            newScore.setCompletedAt(LocalDateTime.now());
            scoreRepository.save(newScore);
        }
    }
}