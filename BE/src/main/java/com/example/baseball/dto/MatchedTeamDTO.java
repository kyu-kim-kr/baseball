package com.example.baseball.dto;

import com.example.baseball.entity.Game;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;

public class MatchedTeamDTO {
    @Id
    @JsonIgnore
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

    public static MatchedTeamDTO of(Game game) {
        return new MatchedTeamDTO(game.getId(), game.getHomeTeam(), game.getAwayTeam());
    }

}
