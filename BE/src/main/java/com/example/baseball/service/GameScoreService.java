package com.example.baseball.service;

import com.example.baseball.dto.*;
import com.example.baseball.entity.*;
import com.example.baseball.repository.BallCountRepository;
import com.example.baseball.repository.GameRepository;
import com.example.baseball.repository.PlayerRepository;
import com.example.baseball.repository.ScoreRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class GameScoreService {
    private GameRepository gameRepository;
    private ScoreRepository scoreRepository;
    private PlayerRepository playerRepository;
    private BallCountRepository ballCountRepository;

    public GameScoreService(GameRepository gameRepository, ScoreRepository scoreRepository, PlayerRepository playerRepository, BallCountRepository ballCountRepository) {
        this.gameRepository = gameRepository;
        this.scoreRepository = scoreRepository;
        this.playerRepository = playerRepository;
        this.ballCountRepository = ballCountRepository;
    }

    public PlayGameDTO findAttackGameDTO(Integer inning, String inningStatus) {
        String attackTeam = ""; //inningStatus가 TOP일때는 away
        String defenseTeam = "";

        HalfInningGameResponseDTO halfInningGameResponseDTO = HalfInningGameResponseDTO.of(gameRepository.findGameByInningAndInningStatus(inning, InningStatus.valueOf(inningStatus)).orElseThrow(IllegalArgumentException::new));
        GameScoreResponseDTO gameScoreResponseDTO = GameScoreResponseDTO
                .of(scoreRepository.findByHomeTeamAndAwayTeam(halfInningGameResponseDTO.getHomeTeam(), halfInningGameResponseDTO.getAwayTeam()).orElseThrow(IllegalArgumentException::new));

        if(inningStatus.equals(InningStatus.TOP.toString())) { //put 로직에 추가해야됨
            attackTeam = halfInningGameResponseDTO.getAwayTeam();
            defenseTeam = halfInningGameResponseDTO.getHomeTeam();
        }

        if(inningStatus.equals(InningStatus.BOTTOM.toString())) {
            attackTeam = halfInningGameResponseDTO.getHomeTeam();
            defenseTeam = halfInningGameResponseDTO.getAwayTeam();
        }

        List<PlayerResponseDTO> playerResponseDTOs = new ArrayList<>();
        playerResponseDTOs.add(PlayerResponseDTO.of(playerRepository.findPlayerByTeamNameAndPositionIsPitcher(defenseTeam).orElseThrow(IllegalArgumentException::new)));
        playerResponseDTOs.add(PlayerResponseDTO.of(playerRepository.findPlayerByTeamNameAndPositionAndBattingIsFalseAndBattingOrder(attackTeam).orElseThrow(IllegalArgumentException::new)));

        List<BallCountDTO> ballCountDTOS = ballCountRepository.findAllByGameId(halfInningGameResponseDTO.getId())
//        List<BallCountDTO> ballCountDTOS = ballCountRepository.findAll()
                .stream()
                .map(ballCount -> BallCountDTO.of(ballCount))
                .collect(Collectors.toList());

        PlayGameDTO gameDTO = new PlayGameDTO(gameScoreResponseDTO, halfInningGameResponseDTO, playerResponseDTOs, ballCountDTOS);

        return gameDTO;
    }

    public PlayGameDTO findPlayGameDTO(Integer inning, String inningStatus) {
        return null;
    }

    public PlayGameDTO updatePitch(Integer inning, String inningStatus) {
        return null;
    }

//    public GameDTO findDefenseGameDTO(Integer inning, String inningStatus) {
//
//        GameScoreResponseDTO gameScoreResponseDTO = GameScoreResponseDTO.of(scoreRepository.findById(1L).orElseThrow(IllegalArgumentException::new));
//        HalfInningGameResponseDTO halfInningGameResponseDTO = HalfInningGameResponseDTO.of(gameRepository.findGameByInningAndInningStatus(inning, InningStatus.valueOf(inningStatus)).orElseThrow(IllegalArgumentException::new));
//
//        List<PlayerResponseDTO> playerResponseDTOs = playerRepository.findAll()
//                .stream()
//                .map(player -> PlayerResponseDTO.of(player))
//                .collect(Collectors.toList());
//
//        List<BallCountDTO> ballCountDTOS = ballCountRepository.findAll()
//                .stream()
//                .map(ballCount -> BallCountDTO.of(ballCount))
//                .collect(Collectors.toList());
//
//        GameDTO gameDTO = new GameDTO(gameScoreResponseDTO, halfInningGameResponseDTO, playerResponseDTOs, ballCountDTOS);
//
//        return gameDTO;
//    }

//    public GameDTO updatePitch(Integer inning, String inningStatus) {
//
//    }
}
