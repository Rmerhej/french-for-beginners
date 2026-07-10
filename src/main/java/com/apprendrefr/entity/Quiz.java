package com.apprendrefr.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "quizzes")
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    @Column(name = "sentence", columnDefinition = "TEXT")
    private String sentence;
    private String words;
    private String correctAnswers;
    private String imageUrl;
    private String quizType;

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

    public String getQuizType() {
        return this.quizType;
    }

    public void setQuizType(String quizType) {
        this.quizType = quizType;
    }
}
