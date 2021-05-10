package com.example.baseball.dto;

import java.util.ArrayList;
import java.util.List;

public class PlayGameDTO {
    private GameScoreDTO gameScoreDTO;
    private HalfInningGameDTO halfInningGameDTO;
    private ArrayList<PlayerDTO> playerDTOs; //0 :투수, 1 :타자
    private List<BallCountDTO> ballCountDTOs;

    public PlayGameDTO(GameScoreDTO gameScoreDTO, HalfInningGameDTO halfInningGameDTO, ArrayList<PlayerDTO> playerDTOs, List<BallCountDTO> ballCountDTOs) {
        this.gameScoreDTO = gameScoreDTO;
        this.halfInningGameDTO = halfInningGameDTO;
        this.playerDTOs = playerDTOs;
        this.ballCountDTOs = ballCountDTOs;
    }

    public GameScoreDTO getGameScoreDTO() {
        return gameScoreDTO;
    }

    public HalfInningGameDTO getHalfInningGameDTO() {
        return halfInningGameDTO;
    }

    public ArrayList<PlayerDTO> getPlayerDTOs() {
        return playerDTOs;
    }

    public List<BallCountDTO> getBallCountDTOs() {
        return ballCountDTOs;
    }
}
