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
    private BallCountService ballCountService;

    String attackTeam = ""; //inningStatus가 TOP일때는 away
    String defenseTeam = "";

    public GameScoreService(GameRepository gameRepository, ScoreRepository scoreRepository, PlayerRepository playerRepository, BallCountRepository ballCountRepository, BallCountService ballCountService) {
        this.gameRepository = gameRepository;
        this.scoreRepository = scoreRepository;
        this.playerRepository = playerRepository;
        this.ballCountRepository = ballCountRepository;
        this.ballCountService = ballCountService;
    }

    public void verifyAttackAndDefense(String inningStatus, HalfInningGameDTO halfInningGameDTO) {
        if(inningStatus.equals(InningStatus.TOP.toString())) { //put 로직에 추가해야됨
            attackTeam = halfInningGameDTO.getAwayTeam();
            defenseTeam = halfInningGameDTO.getHomeTeam();
        }

        if(inningStatus.equals(InningStatus.BOTTOM.toString())) {
            attackTeam = halfInningGameDTO.getHomeTeam();
            defenseTeam = halfInningGameDTO.getAwayTeam();
        }
    }


    public PlayGameDTO findGameDTO(Integer inning, String inningStatus) {

        HalfInningGameDTO halfInningGameDTO = HalfInningGameDTO.of(gameRepository.findGameByInningAndInningStatus(inning, InningStatus.valueOf(inningStatus)).orElseThrow(IllegalArgumentException::new));
        GameScoreDTO gameScoreDTO = GameScoreDTO
                .of(scoreRepository.findByHomeTeamAndAwayTeam(halfInningGameDTO.getHomeTeam(), halfInningGameDTO.getAwayTeam()).orElseThrow(IllegalArgumentException::new));

        verifyAttackAndDefense(inningStatus, halfInningGameDTO);

        ArrayList<PlayerDTO> playerDTOs = new ArrayList<>();
        Player pitcher = playerRepository.findPlayerByTeamNameAndPositionIsPitcher(defenseTeam).orElseThrow(IllegalArgumentException::new);
        Player hitter = playerRepository.findPlayerByTeamNameAndPositionAndBattingIsFalseAndBattingOrder(attackTeam).orElseThrow(IllegalArgumentException::new);
        playerDTOs.add(PlayerDTO.of(pitcher));
        playerDTOs.add(PlayerDTO.of(hitter));

        List<BallCountDTO> ballCountDTOS = ballCountRepository.findAllByGameId(halfInningGameDTO.getId())
                .stream()
                .map(ballCount -> BallCountDTO.of(ballCount))
                .collect(Collectors.toList());

        PlayGameDTO gameDTO = new PlayGameDTO(gameScoreDTO, halfInningGameDTO, playerDTOs, ballCountDTOS);

        return gameDTO;
    }

    public PlayGameDTO updatePitch(Integer inning, String inningStatus) {
        PlayGameDTO nowGame = findGameDTO(inning, inningStatus);
        GameScoreDTO gameScoreDTO = nowGame.getGameScoreDTO();
        HalfInningGameDTO halfInningGameDTO = nowGame.getHalfInningGameDTO();
        ArrayList<PlayerDTO> playerDTOs = nowGame.getPlayerDTOs();
        List<BallCountDTO> ballCountDTOS = nowGame.getBallCountDTOs();

        verifyAttackAndDefense(inningStatus, halfInningGameDTO); //attackTeam, defenseTeam

        PlayerDTO pitcher = playerDTOs.get(0);
        pitcher.addNumberOfPitches(pitcher); // 투구수 증가

        PlayerDTO hitter = playerDTOs.get(1);

        BallCount nowHit = ballCountRepository.save(new BallCount(hitter.getName(), Sbo.randomSbo(), halfInningGameDTO.getId())); //난수로 지금 배팅값 db에 저장
        System.out.println(nowHit.toString());
        ballCountDTOS.add(BallCountDTO.of(nowHit)); // 리스트에도 저장
        ballCountService.updateFourBallOrThreeStrike(hitter.getName(), halfInningGameDTO.getId()); //4볼 3스트라이크 체크

        if(ballCountRepository.countBallCountsByBallAndPlayerName(hitter.getName(), Sbo.HIT.toString(), halfInningGameDTO.getId()).size() == 1
           || ballCountRepository.countBallCountsByBallAndPlayerName(hitter.getName(), Sbo.OUT.toString(), halfInningGameDTO.getId()).size() == 1) {
            hitter.changeBattingStatus(hitter);
            playerDTOs.remove(1);

        }

        int attackPoint = ballCountService.checkScore(halfInningGameDTO.getId());
        gameScoreDTO.updateAttackTeamScore(inningStatus, attackPoint);
        halfInningGameDTO.updateAttackTeamScore(inningStatus, attackPoint);

        if(ballCountRepository.checkScore(Sbo.OUT.toString(), halfInningGameDTO.getId()).size() == 3) {

        }
        return new PlayGameDTO(gameScoreDTO, halfInningGameDTO, playerDTOs, ballCountDTOS);

    }


}
