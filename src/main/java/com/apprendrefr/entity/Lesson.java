package com.apprendrefr.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
//import lombok.Data;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "lessons")
@Data
public class Lesson {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Le titre est obligatoire")
    @Size(min = 3, max = 150, message = "Le titre doit contenir entre 3 et 150 caractères")
    private String title;

    @Column(columnDefinition = "TEXT")
    @Size(max = 2000, message = "Le contenu ne doit pas dépasser 2000 caractères")
    private String content;

    @NotBlank(message = "Le niveau est obligatoire")
    private String level;
    private String category;
    private String imageUrl;
    private String audioUrl;
    @Column(updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}