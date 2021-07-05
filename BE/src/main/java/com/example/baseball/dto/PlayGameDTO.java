package com.example.baseball.dto;

import java.util.ArrayList;
import java.util.List;

public class PlayGameDTO {
    private GameScoreDTO gameScoreDTO;
    private HalfInningGameDTO halfInningGameDTO;
    private PlayerDTO pitcherDTO;
    private PlayerDTO hitterDTO;
//    private ArrayList<PlayerDTO> playerDTOs; //0 :투수, 1 :타자
    private List<BallCountDTO> ballCountDTOs;

//    public PlayGameDTO(GameScoreDTO gameScoreDTO, HalfInningGameDTO halfInningGameDTO, ArrayList<PlayerDTO> playerDTOs, List<BallCountDTO> ballCountDTOs) {
//        this.gameScoreDTO = gameScoreDTO;
//        this.halfInningGameDTO = halfInningGameDTO;
//        this.playerDTOs = playerDTOs;
//        this.ballCountDTOs = ballCountDTOs;
//    }


    public PlayGameDTO(GameScoreDTO gameScoreDTO, HalfInningGameDTO halfInningGameDTO, PlayerDTO pitcherDTO, PlayerDTO hitterDTO, List<BallCountDTO> ballCountDTOs) {
        this.gameScoreDTO = gameScoreDTO;
        this.halfInningGameDTO = halfInningGameDTO;
        this.pitcherDTO = pitcherDTO;
        this.hitterDTO = hitterDTO;
        this.ballCountDTOs = ballCountDTOs;
    }

    public GameScoreDTO getGameScoreDTO() {
        return gameScoreDTO;
    }

    public HalfInningGameDTO getHalfInningGameDTO() {
        return halfInningGameDTO;
    }

//    public ArrayList<PlayerDTO> getPlayerDTOs() {
//        return playerDTOs;
//    }


    public PlayerDTO getPitcherDTO() {
        return pitcherDTO;
    }

    public PlayerDTO getHitterDTO() {
        return hitterDTO;
    }

    public List<BallCountDTO> getBallCountDTOs() {
        return ballCountDTOs;
    }
}
