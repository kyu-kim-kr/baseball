package com.example.baseball.dto;

import com.example.baseball.entity.Game;

public class HalfInningGameResponseDTO {

    private Long id;

    private String homeTeam;
    private String awayTeam;
    private Integer homeScore;
    private Integer awayScore;
    private Integer inning;
    private String inningStatus; //Enum으로 관리

    public HalfInningGameResponseDTO(Long id, String homeTeam, String awayTeam, Integer homeScore, Integer awayScore, Integer inning, String inningStatus) {
        this.id = id;
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
        this.homeScore = homeScore;
        this.awayScore = awayScore;
        this.inning = inning;
        this.inningStatus = inningStatus;
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



    public static HalfInningGameResponseDTO of(Game game) {
        return new HalfInningGameResponseDTO(
                game.getId(),
                game.getHomeTeam(),
                game.getAwayTeam(),
                game.getHomeScore(),
                game.getAwayScore(),
                game.getInning(),
                game.getInningStatus().getStatus()
        );
    }
}

