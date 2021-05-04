package com.example.baseball.entity;

public enum Sbo {
    STRIKE(0, "STRIKE"),
    BALL(1, "BALL"),
    HIT(2, "HIT");

    private int point;
    private String status;

    Sbo(int point, String status) {
        this.point = point;
        this.status = status;
    }
}
