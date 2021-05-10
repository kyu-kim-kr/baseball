package com.example.baseball.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Embedded;
import org.springframework.data.relational.core.mapping.Table;

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
