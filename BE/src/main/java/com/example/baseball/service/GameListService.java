package com.example.baseball.service;

import com.example.baseball.entity.Game;
import com.example.baseball.dto.MatchedTeamDTO;
import com.example.baseball.repository.GameRepository;
import com.example.baseball.repository.ScoreRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class GameListService {

    private final ScoreRepository scoreRepository;

    private GameListService(ScoreRepository scoreRepository) {
        this.scoreRepository = scoreRepository;
    }

    public List<MatchedTeamDTO> findGameList() {
        return scoreRepository.findAll()
                .stream()
                .map(score -> MatchedTeamDTO.of(score))
                .collect(Collectors.toList());
    }

}
