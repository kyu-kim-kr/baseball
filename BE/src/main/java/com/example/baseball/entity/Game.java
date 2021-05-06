package com.example.baseball.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Embedded;
import org.springframework.data.relational.core.mapping.Table;

@Table("Game")
public class Game {
    @Id
    private Long id;

    private String homeTeam;
    private String awayTeam;
    private Integer homeScore;
    private Integer awayScore;
    private Integer inning;
    private InningStatus status;

    @Embedded.Nullable
    private BallCount ballCount;

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

    public InningStatus getStatus() {
        return status;
    }

    public BallCount getBallCount() {
        return ballCount;
    }
}
