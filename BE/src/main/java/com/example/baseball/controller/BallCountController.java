package com.example.baseball.controller;

import com.example.baseball.service.BallCountService;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BallCountController {

    private final BallCountService ballCountService;

    public BallCountController(BallCountService ballCountService) {
        this.ballCountService = ballCountService;
    }

    @DeleteMapping("/delete")
    public void deleteBallCount() {
        ballCountService.deleteBallCount();
    }
}
