package com.example.baseball.dto;

import java.util.List;

public class DetailPageDTO {
    GameScoreResponseDTO gameScoreResponseDTO;
    List<HalfInningGameResponseDTO> halfInningGameResponseDTOs;
    List<PlayerResponseDTO> playerResponseDTOS;

    public DetailPageDTO(GameScoreResponseDTO gameScoreResponseDTO, List<HalfInningGameResponseDTO> halfInningGameResponseDTOs, List<PlayerResponseDTO> playerResponseDTOS) {
        this.gameScoreResponseDTO = gameScoreResponseDTO;
        this.halfInningGameResponseDTOs = halfInningGameResponseDTOs;
        this.playerResponseDTOS = playerResponseDTOS;
    }

    public GameScoreResponseDTO getGameScoreResponseDTO() {
        return gameScoreResponseDTO;
    }

    public List<HalfInningGameResponseDTO> getHalfInningGameResponseDTOs() {
        return halfInningGameResponseDTOs;
    }

    public List<PlayerResponseDTO> getPlayerResponseDTOS() {
        return playerResponseDTOS;
    }

    public DetailPageDTO of(GameScoreResponseDTO gameScoreResponseDTO, List<HalfInningGameResponseDTO> halfInningGameResponseDTOs, List<PlayerResponseDTO> playerResponseDTOS) {
        return new DetailPageDTO(gameScoreResponseDTO, halfInningGameResponseDTOs, playerResponseDTOS);
    }

    @Override
    public String toString() {
        return "DetailPageDTO{" +
                "gameScoreResponseDTO=" + gameScoreResponseDTO +
                ", halfInningGameResponseDTOs=" + halfInningGameResponseDTOs +
                ", playerResponseDTOS=" + playerResponseDTOS +
                '}';
    }
}
