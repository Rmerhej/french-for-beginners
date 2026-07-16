package com.apprendrefr.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "exercises")
@Data
public class Exercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String lessonTitle;
    private String date;
    private String page;
    private String url;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private String correctAnswer;
    private String exerciseType;

    @Column(columnDefinition = "TEXT")
    private String words;

    @Column(columnDefinition = "TEXT")
    private String sentences;

    @Column(columnDefinition = "TEXT")
    private String explanation;
    @Column(columnDefinition = "TEXT")
    private String question;
    private String lessonLevel;
}