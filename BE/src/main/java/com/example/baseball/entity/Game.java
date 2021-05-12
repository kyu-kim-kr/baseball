package com.example.baseball.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Embedded;
import org.springframework.data.relational.core.mapping.Table;

@Table("Game")
public class Game {
    @Id
    private Long id;

    private String homeTeam;
    private String awayTeam;
    private Integer homeScore;
    private Integer awayScore;
    private Integer inning;
    private InningStatus inningStatus;
    private Long scoreId;

    public Game(String homeTeam, String awayTeam, Integer homeScore, Integer awayScore, Integer inning, InningStatus inningStatus, Long scoreId) {
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
        this.homeScore = homeScore;
        this.awayScore = awayScore;
        this.inning = inning;
        this.inningStatus = inningStatus;
        this.scoreId = scoreId;
    }

    public Long getId() {
        return id;
    }

    public String getHomeTeam() {
        return homeTeam;
    }

    public String getAwayTeam() {
        return awayTeam;
    }

    public Integer getHomeScore() {
        return homeScore;
    }

    public Integer getAwayScore() {
        return awayScore;
    }

    public Integer getInning() {
        return inning;
    }

    public InningStatus getInningStatus() {
        return inningStatus;
    }

    public Long getScoreId() {
        return scoreId;
    }
}
