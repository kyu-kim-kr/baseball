package com.example.baseball.entity;

public enum InningStatus {
    TOP("초"),
    BOTTOM("말");

    private String status;

    InningStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
