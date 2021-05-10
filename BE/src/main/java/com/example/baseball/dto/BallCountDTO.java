package com.example.baseball.dto;

import com.example.baseball.entity.BallCount;

public class BallCountDTO {

    private Long id;
    private String playerName;
    private String ball;
    private Long gameId;

    public BallCountDTO(Long id, String playerName, String ball, Long gameId) {
        this.id = id;
        this.playerName = playerName;
        this.ball = ball;
        this.gameId = gameId;
    }

    public Long getId() {
        return id;
    }

    public String getPlayerName() {
        return playerName;
    }

    public String getBall() {
        return ball;
    }

    public Long getGameId() {
        return gameId;
    }

    public static BallCountDTO of(BallCount ballCount) {
        return new BallCountDTO(ballCount.getId(), ballCount.getPlayerName(), ballCount.getBall().getStatus(),ballCount.getGameId());
    }
}
