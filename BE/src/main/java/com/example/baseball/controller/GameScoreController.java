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

    @GetMapping("/game/{listId}/attack/{inning}/{inningStatus}")
    public PlayGameDTO showAttackScreen(@PathVariable Long listId, @PathVariable Integer inning, @PathVariable InningStatus inningStatus) {
        return gameScoreService.findGameDTO(listId, inning, inningStatus);
    }

    @GetMapping("/game/{listId}/defense/{inning}/{inningStatus}")
    public PlayGameDTO showDefenseScreen(@PathVariable Long listId, @PathVariable Integer inning, @PathVariable InningStatus inningStatus) {
        return gameScoreService.findGameDTO(listId, inning, inningStatus);
    }

    @PutMapping("/game/{listId}/defense/{inning}/{inningStatus}")
    public PlayGameDTO updatePitch(@PathVariable Long listId, @PathVariable Integer inning, @PathVariable InningStatus inningStatus) {
        return gameScoreService.updatePitch(listId, inning, inningStatus);
    }


}
