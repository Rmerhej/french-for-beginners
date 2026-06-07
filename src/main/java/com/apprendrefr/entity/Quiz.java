package com.apprendrefr.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "quizzes")
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String sentence;
    private String words;           // ex: "le,a,du"
    private String correctAnswers;  // ex: "le,a"
    private String imageUrl;

    // === Getters et Setters explicites ===
    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getSentence() {
        return sentence;
    }

    public String getWords() {
        return words;
    }

    public String getCorrectAnswers() {
        return correctAnswers;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSentence(String sentence) {
        this.sentence = sentence;
    }

    public void setWords(String words) {
        this.words = words;
    }

    public void setCorrectAnswers(String correctAnswers) {
        this.correctAnswers = correctAnswers;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
