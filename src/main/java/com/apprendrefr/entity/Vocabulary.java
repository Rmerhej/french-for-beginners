package com.apprendrefr.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;
@Entity
@Table(name = "vocabularies")
@Getter @Setter
public class Vocabulary {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Le mot en français est obligatoire")
    @Size(min = 1, max = 100)
    private String frenchWord;

    @NotBlank(message = "La traduction est obligatoire")
    @Size(max = 100)
    private String englishTranslation;

    @Size(max = 100)
    private String pronunciation;

    @Size(max = 500)
    private String exampleSentence;

    private String imageUrl;
    @Column
    private String altText;
    private String audioUrl;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "lesson_id")
    private Lesson lesson;

    @Transient
    private Long lessonId;

}