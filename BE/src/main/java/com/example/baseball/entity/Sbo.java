package com.example.baseball.entity;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

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

    private static final List<Sbo> VALUES =
            Collections.unmodifiableList(Arrays.asList(values()));
    private static final int SIZE = VALUES.size();
    private static final Random RANDOM = new Random();

    public static Sbo randomSbo()  {
        return VALUES.get(RANDOM.nextInt(SIZE));
    }
}
