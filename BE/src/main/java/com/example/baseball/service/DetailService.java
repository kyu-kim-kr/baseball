package com.example.baseball.service;

import com.example.baseball.dto.*;

import com.example.baseball.repository.GameRepository;
import com.example.baseball.repository.PlayerRepository;
import com.example.baseball.repository.ScoreRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class DetailService {

    private final ScoreRepository scoreRepository;
    private final GameRepository gameRepository;
    private final PlayerRepository playerRepository;

    public DetailService(ScoreRepository scoreRepository, GameRepository gameRepository, PlayerRepository playerRepository) {
        this.scoreRepository = scoreRepository;
        this.gameRepository = gameRepository;
        this.playerRepository = playerRepository;
    }


    public DetailPageDTO showDetailpage(Long gameId, String teamName) {
        GameScoreResponseDTO score = GameScoreResponseDTO.of(scoreRepository.findById(gameId).orElseThrow(IllegalArgumentException::new));

        List<HalfInningGameResponseDTO> halfInningGameResponseDTOs = gameRepository.findGamesByHomeTeam(score.getHomeTeam())
                .stream()
                .map(game -> HalfInningGameResponseDTO.of(game))
                .collect(Collectors.toList());

        List<PlayerResponseDTO> players = playerRepository.findPlayersByTeamName(teamName)
                .stream()
                .map(player -> PlayerResponseDTO.of(player))
                .collect(Collectors.toList());

        return new DetailPageDTO(score, halfInningGameResponseDTOs, players);
    }
}
