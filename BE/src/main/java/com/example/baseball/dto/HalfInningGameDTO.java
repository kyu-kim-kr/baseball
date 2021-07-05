package com.example.baseball.dto;

import com.example.baseball.entity.Game;
import com.example.baseball.entity.InningStatus;

public class HalfInningGameDTO {

    private Long id;

    private String homeTeam;
    private String awayTeam;
    private Integer homeScore;
    private Integer awayScore;
    private Integer inning;
    private String inningStatus; //Enum으로 관리
    private Long scoreId;

    public HalfInningGameDTO(Long id, String homeTeam, String awayTeam, Integer homeScore, Integer awayScore, Integer inning, String inningStatus, Long scoreId) {
        this.id = id;
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

    public String getInningStatus() {
        return inningStatus;
    }

    public Long getScoreId() {
        return scoreId;
    }

    public static HalfInningGameDTO of(Game game) {
        return new HalfInningGameDTO(
                game.getId(),
                game.getHomeTeam(),
                game.getAwayTeam(),
                game.getHomeScore(),
                game.getAwayScore(),
                game.getInning(),
                game.getInningStatus().getStatus(),
                game.getScoreId()
        );
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

