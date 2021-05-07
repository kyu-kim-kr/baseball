package com.example.baseball.dto;

import com.example.baseball.entity.BallCount;
import com.example.baseball.entity.Sbo;

public class BallCountDTO {

    private Long id;
    private String ball;
    private boolean hit;
    private Long gameId;

    public BallCountDTO(Long id, String ball, boolean hit, Long gameId) {
        this.id = id;
        this.ball = ball;
        this.hit = hit;
        this.gameId = gameId;
    }

    public Long getId() {
        return id;
    }

    public String getBall() {
        return ball;
    }

    public boolean isHit() {
        return hit;
    }

    public Long getGameId() {
        return gameId;
    }

    public static BallCountDTO of(BallCount ballCount) {
        return new BallCountDTO(ballCount.getId(), ballCount.getBall().toString(), ballCount.isHit(), ballCount.getGameId());
    }
}
