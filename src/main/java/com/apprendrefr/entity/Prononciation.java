package com.apprendrefr.model;

import jakarta.persistence.*;
import lombok.*;
@Entity
@Table(name = "prononciation")
@Getter @Setter
public class Prononciation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(nullable = false)
    private String son;


    @Column(nullable = false)
    private String exemple;


    private String audio;


    public Prononciation() {
    }


    public Prononciation(String son, String exemple, String audio) {
        this.son = son;
        this.exemple = exemple;
        this.audio = audio;
    }

}