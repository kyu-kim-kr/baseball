package com.example.baseball.service;

import com.example.baseball.entity.Game;
import com.example.baseball.dto.MatchedTeamDTO;
import com.example.baseball.repository.GameRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class GameListService {

    private final GameRepository gameRepository;

    private GameListService(GameRepository gameRepository) {
        this.gameRepository = gameRepository;
    }

    public MatchedTeamDTO findGame(Long id) {
        Game game = gameRepository.findById(id).orElseThrow(IllegalArgumentException::new);
        System.out.println(game.getId());
        return MatchedTeamDTO.of(game);
    }

    public List<MatchedTeamDTO> findGameList() {
        return gameRepository.findAll()
                .stream()
                .map(game -> findGame(game.getId()))
                .collect(Collectors.toList());
    }

}
