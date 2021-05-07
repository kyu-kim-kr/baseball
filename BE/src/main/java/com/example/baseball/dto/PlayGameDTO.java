package com.example.baseball.dto;

import java.util.ArrayList;
import java.util.List;

public class PlayGameDTO {
    private GameScoreResponseDTO gameScoreResponseDTO;
    private HalfInningGameResponseDTO halfInningGameResponseDTO;
    private List<PlayerResponseDTO> players = new ArrayList<>(2); //0 :투수, 1 :타자
    private List<BallCountDTO> ballCounts;

    public PlayGameDTO(GameScoreResponseDTO gameScoreResponseDTO, HalfInningGameResponseDTO halfInningGameResponseDTO, List<PlayerResponseDTO> players, List<BallCountDTO> ballCounts) {
        this.gameScoreResponseDTO = gameScoreResponseDTO;
        this.halfInningGameResponseDTO = halfInningGameResponseDTO;
        this.players = players;
        this.ballCounts = ballCounts;
    }

    public GameScoreResponseDTO getGameScoreResponseDTO() {
        return gameScoreResponseDTO;
    }

    public HalfInningGameResponseDTO getHalfInningGameResponseDTO() {
        return halfInningGameResponseDTO;
    }

    public List<PlayerResponseDTO> getPlayers() {
        return players;
    }

    public List<BallCountDTO> getBallCounts() {
        return ballCounts;
    }
}
