package com.apprendrefr.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

/**
 * Réponse d'un utilisateur à un exercice (QCM) : une ligne par réponse donnée.
 * score = 1 si la réponse est juste, 0 sinon.
 */
@Entity
@Table(name = "users_exercises_scores")
@Getter
@Setter
public class UserExerciseScore {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(optional = false)
    @JoinColumn(name = "exercise_id", nullable = false)
    private Exercise exercise;

    @Column(name = "completed_at", nullable = false)
    private LocalDateTime completedAt;

    @Column(nullable = false)
    private int score;

    public UserExerciseScore() {
    }

    public UserExerciseScore(User user, Exercise exercise, int score) {
        this.user = user;
        this.exercise = exercise;
        this.score = score;
    }

    @PrePersist
    private void onCreate() {
        if (this.completedAt == null) {
            this.completedAt = LocalDateTime.now();
        }
    }
}
