package com.example.baseball.entity;

import org.springframework.data.annotation.Id;

public class Player {
    @Id
    private String name;
    private String teamName;
    private String position;
    private Integer atBat; //타석
    private Integer hits;
    private Integer out;
    private Double battingAverage; //타율
    private Integer numberOfPitches; //투구수
    private Integer battingOrder; //타석 나가는 순서
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

    public Integer getAtBat() {
        return atBat;
    }

    public Integer getHits() {
        return hits;
    }

    public Integer getOut() {
        return out;
    }

    public Double getBattingAverage() {
        return battingAverage;
    }

    public Integer getNumberOfPitches() {
        return numberOfPitches;
    }

    public Integer getBattingOrder() {
        return battingOrder;
    }

    public boolean isBatting() {
        return isBatting;
    }
}
