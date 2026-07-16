package com.apprendrefr.entity;

import jakarta.persistence.*;
import lombok.*;
@Entity
@Table(name = "quizzes")
@Getter @Setter
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

}
