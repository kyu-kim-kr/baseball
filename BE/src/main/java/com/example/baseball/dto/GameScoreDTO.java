package com.example.baseball.dto;

import com.example.baseball.entity.InningStatus;
import com.example.baseball.entity.Score;

public class GameScoreDTO {
    private Long id;
    private String homeTeam;
    private String awayTeam;
    private Integer homeScore;
    private Integer awayScore;

    public GameScoreDTO(Long id, String homeTeam, String awayTeam, Integer homeScore, Integer awayScore) {
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

    public static GameScoreDTO of(Score score) {
        return new GameScoreDTO(score.getId(), score.getHomeTeam(), score.getAwayTeam(), score.getHomeScore(), score.getAwayScore());
    }


    public void updateAttackTeamScore(String inningStatus, int attackPoint) {
        if(inningStatus.equals(InningStatus.TOP.toString())) {
            this.awayScore = awayScore + attackPoint;
        }
        if(inningStatus.equals(InningStatus.BOTTOM.toString())) {
            this.homeScore += homeScore + attackPoint;
        }
    }
}
