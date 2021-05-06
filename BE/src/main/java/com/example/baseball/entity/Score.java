package com.example.baseball.entity;

import org.springframework.data.annotation.Id;


public class Score {
    @Id
    private Long id;
    private String homeTeam;
    private String awayTeam;
    private int homeScore;
    private int awayScore;

    public int getHomeScore() {
        return homeScore;
    }

    public int getAwayScore() {
        return awayScore;
    }

    public String getHomeTeam() {
        return homeTeam;
    }

    public String getAwayTeam() {
        return awayTeam;
    }
}
