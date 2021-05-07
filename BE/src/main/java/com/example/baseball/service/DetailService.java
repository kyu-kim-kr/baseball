package com.example.baseball.service;

import com.example.baseball.dto.DetailPageDTO;
import com.example.baseball.dto.HalfInningGameResponseDTO;
import com.example.baseball.dto.PlayerResponseDTO;
import com.example.baseball.entity.Game;
import com.example.baseball.entity.Score;
import com.example.baseball.repository.GameRepository;
import com.example.baseball.repository.PlayerRepository;
import com.example.baseball.repository.ScoreRepository;

import java.util.List;

public class DetailService {

    private final ScoreRepository scoreRepository;
    private final GameRepository gameRepository;
    private final PlayerRepository playerRepository;
    private final HalfInningGameResponseDTO halfInningGameResponseDTO;
    private final PlayerResponseDTO playerResponseDTO;

    public DetailService(ScoreRepository scoreRepository, GameRepository gameRepository, PlayerRepository playerRepository, HalfInningGameResponseDTO halfInningGameResponseDTO, PlayerResponseDTO playerResponseDTO) {
        this.scoreRepository = scoreRepository;
        this.gameRepository = gameRepository;
        this.playerRepository = playerRepository;
        this.halfInningGameResponseDTO = halfInningGameResponseDTO;
        this.playerResponseDTO = playerResponseDTO;
    }

//    public DetailPageDTO showDetailpage(Long gameId) {
//        Score score = scoreRepository.findById(gameId).orElseThrow(IllegalArgumentException::new);
//        List<Game> games = gameRepository.findGamesByHomeTeam(score.getHomeTeam());
        //playerRepository.findPlayersByTeamNameAndBattingIsTrue();
    }
}
