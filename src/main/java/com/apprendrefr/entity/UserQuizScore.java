package com.apprendrefr.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

/** Une tentative d'un utilisateur sur un quiz glisser-déposer : score = zones justes, total = zones. */
@Entity
@Table(name = "users_quizzes_scores")
@Getter
@Setter
public class UserQuizScore {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(optional = false)
    @JoinColumn(name = "quiz_id", nullable = false)
    private Quiz quiz;

    @Column(nullable = false)
    private int score;

    @Column(nullable = false)
    private int total;

    @Column(name = "completed_at", nullable = false)
    private LocalDateTime completedAt;

    public UserQuizScore() {
    }

    public UserQuizScore(User user, Quiz quiz, int score, int total) {
        this.user = user;
        this.quiz = quiz;
        this.score = score;
        this.total = total;
    }

    @PrePersist
    private void onCreate() {
        if (completedAt == null) {
            completedAt = LocalDateTime.now();
        }
    }
}
