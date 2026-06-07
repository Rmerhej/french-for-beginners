package com.apprendrefr.repository;

import com.apprendrefr.entity.UserExerciseScore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface UserExerciseScoreRepository extends JpaRepository<UserExerciseScore, Long> {

    // Cette ligne est magique : elle permet de chercher un score existant par ID d'user et d'exercice
    Optional<UserExerciseScore> findByUserIdAndExerciseId(Long userId, Long exerciseId);
}