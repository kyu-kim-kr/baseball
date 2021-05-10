package com.example.baseball.controller;

import com.example.baseball.dto.PlayGameDTO;
import com.example.baseball.entity.InningStatus;
import com.example.baseball.service.GameScoreService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GameScoreController {

    private GameScoreService gameScoreService;

    public GameScoreController(GameScoreService gameScoreService) {
        this.gameScoreService = gameScoreService;
    }

    @GetMapping("/game/attack/{inning}/{inningStatus}")
    public PlayGameDTO showAttackScreen(@PathVariable Integer inning, @PathVariable String inningStatus) {
        return gameScoreService.findGameDTO(inning, inningStatus);
    }

    @GetMapping("/game/defense/{inning}/{inningStatus}")
    public PlayGameDTO showDefenseScreen(@PathVariable Integer inning, @PathVariable String inningStatus) {
        return gameScoreService.findGameDTO(inning, inningStatus);
    }

    @PutMapping("/game/defense/{inning}/{inningStatus}")
    public PlayGameDTO updatePitch(@PathVariable Integer inning, @PathVariable String inningStatus) {
        return gameScoreService.updatePitch(inning, inningStatus);
    }


}
