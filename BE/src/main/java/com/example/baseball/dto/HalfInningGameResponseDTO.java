package com.example.baseball.dto;

import com.example.baseball.entity.BallCount;
import com.example.baseball.entity.Game;
import com.example.baseball.entity.InningStatus;

public class HalfInningGameResponseDTO {

    private String homeTeam;
    private String awayTeam;
    private Integer homeScore;
    private Integer awayScore;
    private Integer inning;
    private InningStatus status; //Enum으로 관리
    private BallCount ballCount;

    public HalfInningGameResponseDTO(String homeTeam, String awayTeam, Integer homeScore, Integer awayScore, Integer inning, InningStatus status, BallCount ballCount) {
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
        this.homeScore = homeScore;
        this.awayScore = awayScore;
        this.inning = inning;
        this.status = status;
        this.ballCount = ballCount;
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

    public InningStatus getStatus() {
        return status;
    }

    public BallCount getBallCount() {
        return ballCount;
    }


    public static HalfInningGameResponseDTO of(Game game) {
        return new HalfInningGameResponseDTO(
                game.getHomeTeam(),
                game.getAwayTeam(),
                game.getHomeScore(),
                game.getAwayScore(),
                game.getInning(),
                game.getStatus(),
                game.getBallCount()
        );
    }
}

