package com.example.baseball.entity;

public enum Sbo {
    STRIKE("STRIKE"),
    BALL("BALL"),
    HIT( "HIT");

    private String status;

    Sbo(String status) {
        this.status = status;
    }
}
