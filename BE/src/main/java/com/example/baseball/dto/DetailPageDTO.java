package com.example.baseball.dto;

import com.example.baseball.entity.Score;

import java.util.List;

public class DetailPageDTO {
    Score score;
    List<HalfInningGameResponseDTO> halfInningGameResponseDTOs;
    List<PlayerResponseDTO> playerResponseDTOS;

    public DetailPageDTO(Score score, List<HalfInningGameResponseDTO> halfInningGameResponseDTOs, List<PlayerResponseDTO> playerResponseDTOS) {
        this.score = score;
        this.halfInningGameResponseDTOs = halfInningGameResponseDTOs;
        this.playerResponseDTOS = playerResponseDTOS;
    }

    public Score getScore() {
        return score;
    }

    public List<HalfInningGameResponseDTO> getHalfInningGameResponseDTOs() {
        return halfInningGameResponseDTOs;
    }

    public List<PlayerResponseDTO> getPlayerResponseDTOS() {
        return playerResponseDTOS;
    }

    public DetailPageDTO of(Score score, List<HalfInningGameResponseDTO> halfInningGameResponseDTOs, List<PlayerResponseDTO> playerResponseDTOS) {
        return new DetailPageDTO(score, halfInningGameResponseDTOs, playerResponseDTOS);
    }

    @Override
    public String toString() {
        return "DetailPageDTO{" +
                "score=" + score +
                ", halfInningGameResponseDTOs=" + halfInningGameResponseDTOs +
                ", playerResponseDTOS=" + playerResponseDTOS +
                '}';
    }
}
