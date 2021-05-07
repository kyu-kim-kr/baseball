package com.example.baseball.dto;

import com.example.baseball.entity.Game;
import com.example.baseball.entity.Player;

public class PlayerResponseDTO {
    private String name;
    private String position;
    private String atBat; //타석
    private int hits;
    private int out;
    private double battingAverage; //타율
    private int numberOfPitches; //투구수

    public PlayerResponseDTO(String name, String position, String atBat, int hits, int out, double battingAverage, int numberOfPitches) {
        this.name = name;
        this.position = position;
        this.atBat = atBat;
        this.hits = hits;
        this.out = out;
        this.battingAverage = battingAverage;
        this.numberOfPitches = numberOfPitches;
    }

    public String getName() {
        return name;
    }

    public String getPosition() {
        return position;
    }

    public String getAtBat() {
        return atBat;
    }

    public int getHits() {
        return hits;
    }

    public int getOut() {
        return out;
    }

    public double getBattingAverage() {
        return battingAverage;
    }

    public int getNumberOfPitches() {
        return numberOfPitches;
    }

    public static PlayerResponseDTO of(Player player) {
        return new PlayerResponseDTO(
                player.getName(),
                player.getPosition(),
                player.getAtBat(),
                player.getHits(),
                player.getOut(),
                player.getBattingAverage(),
                player.getNumberOfPitches()
                );
    }
}
