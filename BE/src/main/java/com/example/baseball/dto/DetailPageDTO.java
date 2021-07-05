package com.example.baseball.dto;

import java.util.List;

public class DetailPageDTO {
    GameScoreDTO gameScoreDTO;
    List<HalfInningGameDTO> halfInningGameDTOS;
    List<PlayerDTO> playerDTOS;

    public DetailPageDTO(GameScoreDTO gameScoreDTO, List<HalfInningGameDTO> halfInningGameDTOS, List<PlayerDTO> playerDTOS) {
        this.gameScoreDTO = gameScoreDTO;
        this.halfInningGameDTOS = halfInningGameDTOS;
        this.playerDTOS = playerDTOS;
    }

    public GameScoreDTO getGameScoreResponseDTO() {
        return gameScoreDTO;
    }

    public List<HalfInningGameDTO> getHalfInningGameDTOs() {
        return halfInningGameDTOS;
    }

    public List<PlayerDTO> getPlayerResponseDTOS() {
        return playerDTOS;
    }

    public DetailPageDTO of(GameScoreDTO gameScoreDTO, List<HalfInningGameDTO> halfInningGameDTOS, List<PlayerDTO> playerDTOS) {
        return new DetailPageDTO(gameScoreDTO, halfInningGameDTOS, playerDTOS);
    }

    @Override
    public String toString() {
        return "DetailPageDTO{" +
                "gameScoreResponseDTO=" + gameScoreDTO +
                ", HalfInningGameDTOs=" + halfInningGameDTOS +
                ", playerResponseDTOS=" + playerDTOS +
                '}';
    }
}
