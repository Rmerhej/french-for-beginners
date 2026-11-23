package com.apprendrefr.repository;

import com.apprendrefr.entity.UserQuizScore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface UserQuizScoreRepository extends JpaRepository<UserQuizScore, Long> {

    long countByUserId(Long userId);

    /** Supprime tous les résultats d'un utilisateur (suppression de son compte). */
    @Transactional
    @Modifying(clearAutomatically = true)
    @Query("delete from UserQuizScore s where s.user.id = :userId")
    void deleteByUserId(@Param("userId") Long userId);

    List<UserQuizScore> findTop10ByUserIdOrderByCompletedAtDesc(Long userId);

    /** Quiz réussis à 100 % au moins une fois. */
    @Query("select s.quiz.id from UserQuizScore s "
            + "where s.user.id = :userId and s.total > 0 and s.score = s.total group by s.quiz.id")
    List<Long> findPerfectQuizIds(@Param("userId") Long userId);

    /** Quiz déjà tentés. */
    @Query("select s.quiz.id from UserQuizScore s where s.user.id = :userId group by s.quiz.id")
    List<Long> findAttemptedQuizIds(@Param("userId") Long userId);
}
