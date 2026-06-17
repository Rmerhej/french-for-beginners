package com.apprendrefr.entity;
import jakarta.persistence.*;
import java.time.LocalDateTime;
@Entity
@Table(name = "users_exercises_scores")
public class UserExerciseScore {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    //Liaison vers la table users
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    //
    @ManyToOne(optional = false)
    @JoinColumn(name = "exercise_id", nullable = false)
    private Exercise exercise;
    @Column(name="completed_at", nullable = false)
    private LocalDateTime completedAt;
    @PrePersist
    private void onCreate() {
        this.completedAt = LocalDateTime.now();
    }
    private int score;

    public UserExerciseScore(){}
    public UserExerciseScore(User user, Exercise exercise, int score, LocalDateTime completedAt){
        this.user = user;
        this.exercise = exercise;
        this.score = score;
        this.completedAt = LocalDateTime.now();
    }

    public UserExerciseScore(User user, Exercise exercise, int points) {
        this.user = user;
        this.exercise = exercise;
        this.score = points;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Exercise getExercise() {
        return exercise;
    }

    public void setExercise(Exercise exercise) {
        this.exercise = exercise;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public LocalDateTime getCompletedAt() {
        return completedAt;
    }

    public void setCompletedAt(LocalDateTime completedAt) {
        this.completedAt = completedAt;
    }
}
