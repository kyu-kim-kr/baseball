package com.example.baseball.entity;

import org.springframework.data.annotation.Id;

public class Player {
    @Id
    private String name;
    private String teamName;
    private String position;
    private String atBat; //타석
    private int hits;
    private int out;
    private double battingAverage; //타율
    private int numberOfPitches; //투구수
    private int battingOrder; //타석 나가는 순서
    private boolean isBatting; //공격 차례에서 타석에 나갔는지 안나갔는지 체크

    public String getName() {
        return name;
    }

    public String getTeamName() {
        return teamName;
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

    public boolean isBatting() {
        return isBatting;
    }
}
