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


    public DetailPageDTO showHomeDetailPage(String teamName) {
        GameScoreDTO score = GameScoreDTO.of(scoreRepository.findScoreByHomeTeam(teamName).orElseThrow(IllegalArgumentException::new));

        List<HalfInningGameDTO> halfInningGameDTOS = gameRepository.findAll()
                .stream()
                .map(game -> HalfInningGameDTO.of(game))
                .collect(Collectors.toList());

        List<PlayerDTO> players = playerRepository.findHitterByTeamName(teamName)
                .stream()
                .map(player -> PlayerDTO.of(player))
                .collect(Collectors.toList());

        return new DetailPageDTO(score, halfInningGameDTOS, players);
    }
    public DetailPageDTO showAwayDetailPage(String teamName) {
        GameScoreDTO score = GameScoreDTO.of(scoreRepository.findScoreByAwayTeam(teamName).orElseThrow(IllegalArgumentException::new));

        List<HalfInningGameDTO> halfInningGameDTOS = gameRepository.findAll()
                .stream()
                .map(game -> HalfInningGameDTO.of(game))
                .collect(Collectors.toList());

        List<PlayerDTO> players = playerRepository.findHitterByTeamName(teamName)
                .stream()
                .map(player -> PlayerDTO.of(player))
                .collect(Collectors.toList());

        return new DetailPageDTO(score, halfInningGameDTOS, players);
    }
}
