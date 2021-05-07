package com.example.baseball.service;

import com.example.baseball.dto.*;
import com.example.baseball.entity.Game;
import com.example.baseball.entity.Score;
import com.example.baseball.repository.GameRepository;
import com.example.baseball.repository.PlayerRepository;
import com.example.baseball.repository.ScoreRepository;

public class GameScoreService {
    private GameRepository gameRepository;
    private ScoreRepository scoreRepository;
    private PlayerRepository playerRepository;

    public GameScoreService(GameRepository gameRepository, ScoreRepository scoreRepository, PlayerRepository playerRepository) {
        this.gameRepository = gameRepository;
        this.scoreRepository = scoreRepository;
        this.playerRepository = playerRepository;
    }

    public GameDTO findGameDTO() {
        HalfInningGameResponseDTO halfInningGameResponseDTO = HalfInningGameResponseDTO.of(gameRepository.findById(1L).orElseThrow(IllegalArgumentException::new));
        PlayerResponseDTO playerResponseDTO = PlayerResponseDTO.of(playerRepository.findById("Tree").orElseThrow(IllegalArgumentException::new));
        GameDTO gameDTO = new GameDTO(halfInningGameResponseDTO, playerResponseDTO);
        return gameDTO;
    }
}
