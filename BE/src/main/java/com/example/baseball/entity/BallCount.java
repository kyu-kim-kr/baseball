package com.example.baseball.entity;

import org.springframework.data.annotation.Id;

public class BallCount {

    @Id
    private Long id;
    private String playerName;
    private Sbo ball;
    private Long gameId;

    public Long getId() {
        return id;
    }

    public String getPlayerName() {
        return playerName;
    }

    public Sbo getBall() {
        return ball;
    }

    public Long getGameId() {
        return gameId;
    }
}
