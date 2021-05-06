package com.example.baseball.dto;

import com.example.baseball.entity.Score;

public class GameScoreResponseDTO {
    private String homeTeam;
    private String awayTeam;
    private int homeScore;
    private int awayScore;

    public GameScoreResponseDTO(String homeTeam, String awayTeam, int homeScore, int awayScore) {
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
        this.homeScore = homeScore;
        this.awayScore = awayScore;
    }

    public String getHomeTeam() {
        return homeTeam;
    }

    public String getAwayTeam() {
        return awayTeam;
    }

    public int getHomeScore() {
        return homeScore;
    }

    public int getAwayScore() {
        return awayScore;
    }

    public static GameScoreResponseDTO builderGameScoreResponseDTO(Score score) {
        return new GameScoreResponseDTO(score.getHomeTeam(), score.getAwayTeam(), score.getHomeScore(), score.getAwayScore());
    }
}
