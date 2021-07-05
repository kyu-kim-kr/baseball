package com.example.baseball.controller;

import com.example.baseball.dto.MatchedListDTO;
import com.example.baseball.dto.MatchedTeamDTO;
import com.example.baseball.service.GameListService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GameListController {
    private final GameListService gameListService;
    
    public GameListController (GameListService gameListService) {
        this.gameListService = gameListService;
    }

    @GetMapping("/matchList")
    public MatchedListDTO findGameList() {
        return gameListService.findGameList();
    }
}
