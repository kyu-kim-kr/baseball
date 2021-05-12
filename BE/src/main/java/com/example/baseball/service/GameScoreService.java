package com.example.baseball.service;

import com.example.baseball.dto.*;
import com.example.baseball.entity.*;
import com.example.baseball.repository.BallCountRepository;
import com.example.baseball.repository.GameRepository;
import com.example.baseball.repository.PlayerRepository;
import com.example.baseball.repository.ScoreRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

        PlayerDTO pitcherDTO = PlayerDTO.of(playerRepository.findPlayerByTeamNameAndPositionIsPitcher(defenseTeam).orElseThrow(IllegalArgumentException::new));
        PlayerDTO hitterDTO = PlayerDTO.of(playerRepository.findPlayerByTeamNameAndPositionAndBattingIsFalseAndBattingOrder(attackTeam).orElseThrow(IllegalArgumentException::new));

//        Player pitcher = playerRepository.findPlayerByTeamNameAndPositionIsPitcher(defenseTeam).orElseThrow(IllegalArgumentException::new);
//        Player hitter = playerRepository.findPlayerByTeamNameAndPositionAndBattingIsFalseAndBattingOrder(attackTeam).orElseThrow(IllegalArgumentException::new);
//        playerDTOs.add(PlayerDTO.of(pitcher));
//        playerDTOs.add(PlayerDTO.of(hitter));

        List<BallCountDTO> ballCountDTOS = ballCountRepository.findAllByGameId(halfInningGameDTO.getId())
                .stream()
                .map(ballCount -> BallCountDTO.of(ballCount))
                .collect(Collectors.toList());

        PlayGameDTO gameDTO = new PlayGameDTO(gameScoreDTO, halfInningGameDTO, pitcherDTO, hitterDTO, ballCountDTOS);

        return gameDTO;
    }

    @Transactional
    public PlayGameDTO updatePitch(Integer inning, String inningStatus) {
        PlayGameDTO nowGame = findGameDTO(inning, inningStatus);
        GameScoreDTO gameScoreDTO = nowGame.getGameScoreDTO();
        HalfInningGameDTO halfInningGameDTO = nowGame.getHalfInningGameDTO();
        PlayerDTO pitcherDTO = nowGame.getPitcherDTO();
        PlayerDTO hitterDTO = nowGame.getHitterDTO();
        List<BallCountDTO> ballCountDTOS = nowGame.getBallCountDTOs();

        verifyAttackAndDefense(inningStatus, halfInningGameDTO); //attackTeam, defenseTeam

        playerRepository.updateNumberOfPitchesAtDefenseTeamPitcher(pitcherDTO.getTeamName(), pitcherDTO.getNumberOfPitches() + 1); //투구수 증가

        BallCount nowHit = ballCountRepository.save(new BallCount(hitterDTO.getName(), Sbo.randomSbo(), halfInningGameDTO.getId())); //난수로 지금 배팅값 db에 저장
        ballCountDTOS.add(BallCountDTO.of(nowHit)); // 리스트에도 저장
        ballCountService.updateFourBallOrThreeStrike(hitterDTO.getName(), halfInningGameDTO.getId()); //4볼 3스트라이크 체크

        System.out.println(ballCountRepository.countBallCountsByBallAndPlayerName(hitterDTO.getName(), Sbo.HIT, halfInningGameDTO.getId()).toString());
        System.out.println(ballCountRepository.countBallCountsByBallAndPlayerName(hitterDTO.getName(), Sbo.OUT, halfInningGameDTO.getId()).toString());

        if(ballCountRepository.countBallCountsByBallAndPlayerName(hitterDTO.getName(), Sbo.HIT, halfInningGameDTO.getId()).size() == 1) {
            Integer atBat = hitterDTO.getAtBat() + 1;
            Integer hits = hitterDTO.getHits() + 1;
            Integer out = hitterDTO.getOut();
            Double battingAverage = hits / (double)atBat;
            Player playerHitter = new Player(hitterDTO.getName(), hitterDTO.getTeamName(), hitterDTO.getPosition(), atBat, hits, out, battingAverage, null, hitterDTO.getBattingOrder(), hitterDTO.isBatting());




            playerHitter.changeBattingStatus(playerHitter);
            playerRepository.save(playerHitter);


        }
        if(ballCountRepository.countBallCountsByBallAndPlayerName(hitterDTO.getName(), Sbo.OUT, halfInningGameDTO.getId()).size() == 1) {
            Integer atBat = hitterDTO.getAtBat() + 1;
            Integer hits = hitterDTO.getHits();
            Integer out = hitterDTO.getOut() + 1;
            Double battingAverage = hits / (double)atBat;
            Player playerHitter = new Player(hitterDTO.getName(), hitterDTO.getTeamName(), hitterDTO.getPosition(), atBat, hits, out, battingAverage, null, hitterDTO.getBattingOrder(), hitterDTO.isBatting());

            playerHitter.changeBattingStatus(playerHitter);
            playerRepository.save(playerHitter);

        }

        //모든 선수의 batting이 True가 되었을때, 전부 false로 바꿈
        if(playerRepository.findPlayerByBattingOrderAndTeamName(attackTeam, 8).orElseThrow(IllegalArgumentException::new).isBatting()) {
             playerRepository.updatePlayerByBattingOrderAndTeamName(attackTeam);
        }


        int attackScore = ballCountService.checkScore(halfInningGameDTO.getId());

        if(inningStatus.equals(InningStatus.TOP.toString())) {

            Game game = new Game(halfInningGameDTO.getId(), halfInningGameDTO.getHomeTeam(), halfInningGameDTO.getAwayTeam(), halfInningGameDTO.getHomeScore(), attackScore, inning, InningStatus.TOP, halfInningGameDTO.getScoreId());
            Score score = new Score(gameScoreDTO.getId(), gameScoreDTO.getHomeTeam(), gameScoreDTO.getAwayTeam(), gameScoreDTO.getHomeScore(), attackScore);
            gameRepository.save(game);
            scoreRepository.save(score);
        }
        if(inningStatus.equals(InningStatus.BOTTOM.toString())) {
            Game game = new Game(halfInningGameDTO.getId(), halfInningGameDTO.getHomeTeam(), halfInningGameDTO.getAwayTeam(), attackScore, halfInningGameDTO.getAwayScore(), inning, InningStatus.BOTTOM, halfInningGameDTO.getScoreId());
            Score score = new Score(gameScoreDTO.getId(), gameScoreDTO.getHomeTeam(), gameScoreDTO.getAwayTeam(), attackScore, gameScoreDTO.getAwayScore());
            gameRepository.save(game);
            scoreRepository.save(score);
        }

        return new PlayGameDTO(gameScoreDTO, halfInningGameDTO, pitcherDTO, hitterDTO, ballCountDTOS);

    }


}
