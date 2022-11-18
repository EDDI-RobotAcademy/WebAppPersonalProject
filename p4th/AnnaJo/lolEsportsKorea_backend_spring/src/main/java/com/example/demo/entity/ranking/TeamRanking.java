package com.example.demo.entity.ranking;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class TeamRanking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonIgnore
    private Long id;

    @Column(nullable = false)
    private String seasonTitle;

    @Column(nullable = false)
    private String ranking;

    @Column(nullable = false)
    private String teamName;

    @Column(nullable = false)
    private String winCount;

    @Column(nullable = false)
    private String loseCount;

    @Column(nullable = false)
    private String goalDifference;

    @Column(nullable = false)
    private String winningRate;

    @Column(nullable = false)
    private String kdaScore;

    @Column(nullable = false)
    private String killCount;

    @Column(nullable = false)
    private String deathCount;

    @Column(nullable = false)
    private String assistCount;
}
