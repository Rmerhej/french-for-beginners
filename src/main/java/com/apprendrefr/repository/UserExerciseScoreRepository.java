package com.apprendrefr.repository;

import com.apprendrefr.entity.UserExerciseScore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserExerciseScoreRepository extends JpaRepository<UserExerciseScore, Integer> {

    long countByUserId(Long userId);

    long countByUserIdAndScore(Long userId, int score);

    List<UserExerciseScore> findTop10ByUserIdOrderByCompletedAtDesc(Long userId);

    /** Exercices déjà réussis au moins une fois. */
    @Query("select s.exercise.id from UserExerciseScore s "
            + "where s.user.id = :userId and s.score > 0 group by s.exercise.id")
    List<Long> findSuccessfulExerciseIds(@Param("userId") Long userId);

    /** Exercices auxquels l'utilisateur a déjà répondu. */
    @Query("select s.exercise.id from UserExerciseScore s "
            + "where s.user.id = :userId group by s.exercise.id")
    List<Long> findAttemptedExerciseIds(@Param("userId") Long userId);

    /** Résultat : [titre de la leçon, réponses données, réponses justes] */
    @Query("select e.lessonTitle, count(s), sum(s.score) from UserExerciseScore s "
            + "join s.exercise e where s.user.id = :userId "
            + "group by e.lessonTitle order by e.lessonTitle")
    List<Object[]> summaryByLesson(@Param("userId") Long userId);
}
