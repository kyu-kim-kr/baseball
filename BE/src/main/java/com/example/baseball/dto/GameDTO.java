package com.example.baseball.dto;

import java.util.List;

public class GameDTO {
    private HalfInningGameResponseDTO halfInningGameResponseDTO;
    private PlayerResponseDTO playerResponseDTO;

    public GameDTO(HalfInningGameResponseDTO halfInningGameResponseDTO, PlayerResponseDTO playerResponseDTO) {
        this.halfInningGameResponseDTO = halfInningGameResponseDTO;
        this.playerResponseDTO = playerResponseDTO;
    }

    public HalfInningGameResponseDTO getHalfInningGameResponseDTO() {
        return halfInningGameResponseDTO;
    }

    public PlayerResponseDTO getPlayerResponseDTO() {
        return playerResponseDTO;
    }
}
