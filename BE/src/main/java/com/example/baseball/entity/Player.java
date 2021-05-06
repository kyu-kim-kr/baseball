package com.example.baseball.entity;

import org.springframework.data.annotation.Id;

public class Player {
    @Id
    private String name;

    private String position;
    private String atBat; //타석
    private int hits;
    private int out;
    private double battingAverage; //타율
    private int numberOfPitches; //투구수
    private int battingOrder; //타석 나가는 순서

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

    public int getBattingOrder() {
        return battingOrder;
    }
}
