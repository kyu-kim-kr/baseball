package com.example.baseball.entity;

public enum Sbo {
    STRIKE("STRIKE"),
    BALL("BALL"),
    HIT( "HIT"),
    OUT("OUT");

    private String status;

    Sbo(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
