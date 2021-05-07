package com.example.baseball.entity;

import org.springframework.data.annotation.Id;

public class BallCount {

    @Id
    private Long id;
    private Sbo ball;
    private boolean isHit;
    private Long gameId;

    public Long getId() {
        return id;
    }

    public Sbo getBall() {
        return ball;
    }

    public boolean isHit() {
        return isHit;
    }

    public Long getGameId() {
        return gameId;
    }
}
