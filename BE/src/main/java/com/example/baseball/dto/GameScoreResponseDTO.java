package com.example.baseball.dto;

import com.example.baseball.entity.Score;

public class GameScoreResponseDTO {
    private Long id;
    private String homeTeam;
    private String awayTeam;
    private Integer homeScore;
    private Integer awayScore;

    public GameScoreResponseDTO(Long id, String homeTeam, String awayTeam, Integer homeScore, Integer awayScore) {
        this.id = id;
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
        this.homeScore = homeScore;
        this.awayScore = awayScore;
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

    public static GameScoreResponseDTO of(Score score) {
        return new GameScoreResponseDTO(score.getId(), score.getHomeTeam(), score.getAwayTeam(), score.getHomeScore(), score.getAwayScore());
    }
}
