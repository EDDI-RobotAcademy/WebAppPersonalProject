package com.example.demo.entity.league;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class League {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonIgnore
    private Long id;

    @Column(nullable = false)
    private String leagueTitle;

    @Column(nullable = false)
    private String date;

    @Column(nullable = false)
    private String time;

    @Column(nullable = false)
    private String gameState;

    @Column(nullable = false)
    private String gameTitle;

    @Column(nullable = false)
    private String homeTeam;

    @Column(nullable = false)
    private String homeTeamScore;

    @Column(nullable = false)
    private String awayTeamScore;

    @Column(nullable = false)
    private String awayTeam;

}
