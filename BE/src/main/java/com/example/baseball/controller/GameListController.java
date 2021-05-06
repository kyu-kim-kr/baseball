package com.example.baseball.controller;

import com.example.baseball.dto.MatchedTeamDTO;
import com.example.baseball.service.GameListService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GameListController {
    private final GameListService gameListService;
    
    public GameListController (GameListService gameListService) {
        this.gameListService = gameListService;
    }

    @GetMapping("/matchTeam/{id}")
    public MatchedTeamDTO findGame(@PathVariable Long id) {
        return gameListService.findGame(id);
    }

    @GetMapping("/helloWorld")
    public List<MatchedTeamDTO> findGameList() {
        List<MatchedTeamDTO> games = gameListService.findGameList();
        return games;
    }

}
