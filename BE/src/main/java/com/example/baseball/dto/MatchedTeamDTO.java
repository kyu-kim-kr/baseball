package com.example.baseball.dto;

import com.example.baseball.entity.Game;
import com.example.baseball.entity.Score;

public class MatchedTeamDTO {
    private Long id;

    private String homeTeam;
    private String awayTeam;

    public MatchedTeamDTO(Long id, String homeTeam, String awayTeam) {
        this.id = id;
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
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

    public static MatchedTeamDTO of(Score score) {
        return new MatchedTeamDTO(score.getId(), score.getHomeTeam(), score.getAwayTeam());
    }

}
