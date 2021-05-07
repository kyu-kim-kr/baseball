package com.example.baseball.controller;

import com.example.baseball.dto.GameDTO;
import com.example.baseball.service.GameScoreService;
import org.springframework.web.bind.annotation.GetMapping;

public class GameScoreController {

    private GameScoreService gameScoreService;

    public GameScoreController(GameScoreService gameScoreService) {
        this.gameScoreService = gameScoreService;
    }

    @GetMapping("/game/attack}")
    public GameDTO showAttackScreen() {
        GameDTO gameDTO = gameScoreService.findGameDTO();
        return gameDTO;
    }
}
