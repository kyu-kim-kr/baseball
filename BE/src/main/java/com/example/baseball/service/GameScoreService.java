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

    public GameScoreService(GameRepository gameRepository, ScoreRepository scoreRepository, PlayerRepository playerRepository, BallCountRepository ballCountRepository, BallCountService ballCountService) {
        this.gameRepository = gameRepository;
        this.scoreRepository = scoreRepository;
        this.playerRepository = playerRepository;
        this.ballCountRepository = ballCountRepository;
        this.ballCountService = ballCountService;
    }

    String attackTeam = ""; //inningStatus가 TOP일때는 away
    String defenseTeam = "";

    public void verifyAttackAndDefense(InningStatus inningStatus, GameScoreDTO gameScoreDTO) {
        if(inningStatus.equals(InningStatus.TOP)) { //put 로직에 추가해야됨
            attackTeam = gameScoreDTO.getAwayTeam();
            defenseTeam = gameScoreDTO.getHomeTeam();
        }

        if(inningStatus.equals(InningStatus.BOTTOM)) {
            attackTeam = gameScoreDTO.getHomeTeam();
            defenseTeam = gameScoreDTO.getAwayTeam();
        }
    }


    public PlayGameDTO findGameDTO(Long listId, Integer inning, InningStatus inningStatus) {
        GameScoreDTO gameScoreDTO = GameScoreDTO.of(scoreRepository.findById(listId).orElseThrow(IllegalArgumentException::new));
        verifyAttackAndDefense(inningStatus, gameScoreDTO);

        HalfInningGameDTO halfInningGameDTO = null;
        if(!gameRepository.findGameByInningAndInningStatus(inning, inningStatus).isPresent()) {
            halfInningGameDTO = HalfInningGameDTO.of(gameRepository.save(new Game(gameScoreDTO.getHomeTeam(), gameScoreDTO.getAwayTeam(), 0, 0, inning, inningStatus, listId)));
        }
        if(gameRepository.findGameByInningAndInningStatus(inning, inningStatus).isPresent()) {
            halfInningGameDTO = HalfInningGameDTO.of(gameRepository.findGameByInningAndInningStatus(inning, inningStatus).orElseThrow(IllegalArgumentException::new));
        }

        verifyAttackAndDefense(inningStatus, gameScoreDTO);

        PlayerDTO pitcherDTO = PlayerDTO.of(playerRepository.findPlayerByTeamNameAndPositionIsPitcher(defenseTeam).orElseThrow(IllegalArgumentException::new));
        PlayerDTO hitterDTO = PlayerDTO.of(playerRepository.findPlayerByTeamNameAndPositionAndBattingIsFalseAndBattingOrder(attackTeam).orElseThrow(IllegalArgumentException::new));

        List<BallCountDTO> ballCountDTOS = ballCountRepository.findAllByGameId(halfInningGameDTO.getId())
                .stream()
                .map(ballCount -> BallCountDTO.of(ballCount))
                .collect(Collectors.toList());

        return new PlayGameDTO(gameScoreDTO, halfInningGameDTO, pitcherDTO, hitterDTO, ballCountDTOS);
    }

    @Transactional
    public PlayGameDTO updatePitch(Long listId, Integer inning, InningStatus inningStatus) {
        PlayGameDTO nowGame = findGameDTO(listId, inning, inningStatus);
        GameScoreDTO gameScoreDTO = nowGame.getGameScoreDTO();
        HalfInningGameDTO halfInningGameDTO = nowGame.getHalfInningGameDTO();
        PlayerDTO pitcherDTO = nowGame.getPitcherDTO();
        PlayerDTO hitterDTO = nowGame.getHitterDTO();
        List<BallCountDTO> ballCountDTOS = nowGame.getBallCountDTOs();



        verifyAttackAndDefense(inningStatus, gameScoreDTO); //attackTeam, defenseTeam

        playerRepository.updateNumberOfPitchesAtDefenseTeamPitcher(pitcherDTO.getTeamName(), pitcherDTO.getNumberOfPitches() + 1); //투구수 증가

        BallCount nowHit = ballCountRepository.save(new BallCount(hitterDTO.getName(), Sbo.randomSbo(), halfInningGameDTO.getId())); //난수로 지금 배팅값 db에 저장
        ballCountDTOS.add(BallCountDTO.of(nowHit)); // 리스트에도 저장
        ballCountService.updateFourBallOrThreeStrike(hitterDTO.getName(), halfInningGameDTO.getId()); //4볼 3스트라이크 체크

        System.out.println(ballCountRepository.countBallCountsByBallAndPlayerName(hitterDTO.getName(), Sbo.HIT, halfInningGameDTO.getId()).toString());
        System.out.println(ballCountRepository.countBallCountsByBallAndPlayerName(hitterDTO.getName(), Sbo.OUT, halfInningGameDTO.getId()).toString());

        if(ballCountRepository.countBallCountsByBallAndPlayerName(hitterDTO.getName(), Sbo.HIT, halfInningGameDTO.getId()).size()
                + ballCountRepository.countBallCountsByBallAndPlayerName(hitterDTO.getName(), Sbo.OUT, halfInningGameDTO.getId()).size() == hitterDTO.getAtBat() + 1
                || nowHit.getBall().equals(Sbo.HIT)) {
            Integer atBat = hitterDTO.getAtBat() + 1;
            Integer hits = hitterDTO.getHits() + 1;
            Integer out = hitterDTO.getOut();
            Double battingAverage = hits / (double)atBat;
            Player playerHitter = new Player(hitterDTO.getName(), hitterDTO.getTeamName(), hitterDTO.getPosition(), atBat, hits, out, battingAverage, null, hitterDTO.getBattingOrder(), hitterDTO.isBatting());

            playerHitter.changeBattingStatus(playerHitter);
            playerRepository.save(playerHitter);
            ballCountRepository.deleteBallCountsByBallAndPlayerNameAndGameId(hitterDTO.getName(), Sbo.STRIKE, halfInningGameDTO.getId());
            ballCountRepository.deleteBallCountsByBallAndPlayerNameAndGameId(hitterDTO.getName(), Sbo.BALL, halfInningGameDTO.getId());
        }
        if(ballCountRepository.countBallCountsByBallAndPlayerName(hitterDTO.getName(), Sbo.HIT, halfInningGameDTO.getId()).size()
                + ballCountRepository.countBallCountsByBallAndPlayerName(hitterDTO.getName(), Sbo.OUT, halfInningGameDTO.getId()).size() == hitterDTO.getAtBat() + 1
                || nowHit.getBall().equals(Sbo.OUT)) {
            Integer atBat = hitterDTO.getAtBat() + 1;
            Integer hits = hitterDTO.getHits();
            Integer out = hitterDTO.getOut() + 1;
            Double battingAverage = hits / (double)atBat;
            Player playerHitter = new Player(hitterDTO.getName(), hitterDTO.getTeamName(), hitterDTO.getPosition(), atBat, hits, out, battingAverage, null, hitterDTO.getBattingOrder(), hitterDTO.isBatting());

            playerHitter.changeBattingStatus(playerHitter);
            playerRepository.save(playerHitter);
            ballCountRepository.deleteBallCountsByBallAndPlayerNameAndGameId(hitterDTO.getName(), Sbo.STRIKE, halfInningGameDTO.getId());
            ballCountRepository.deleteBallCountsByBallAndPlayerNameAndGameId(hitterDTO.getName(), Sbo.BALL, halfInningGameDTO.getId());
        }

        //모든 선수의 batting이 True가 되었을때, 전부 false로 바꿈
        if(playerRepository.findPlayerByBattingOrderAndTeamName(attackTeam, 8).orElseThrow(IllegalArgumentException::new).isBatting()) {
             playerRepository.updatePlayerByBattingOrderAndTeamName(attackTeam);
        }


        int attackScore = ballCountService.checkScore(halfInningGameDTO.getId());

        if(inningStatus.equals(InningStatus.TOP.toString())) {

            Game game = new Game(halfInningGameDTO.getHomeTeam(), halfInningGameDTO.getAwayTeam(), halfInningGameDTO.getHomeScore(), attackScore, inning, InningStatus.TOP, halfInningGameDTO.getScoreId());
            Score score = new Score(gameScoreDTO.getId(), gameScoreDTO.getHomeTeam(), gameScoreDTO.getAwayTeam(), gameScoreDTO.getHomeScore(), attackScore);
            gameRepository.save(game);
            scoreRepository.save(score);
        }
        if(inningStatus.equals(InningStatus.BOTTOM.toString())) {
            Game game = new Game(halfInningGameDTO.getHomeTeam(), halfInningGameDTO.getAwayTeam(), attackScore, halfInningGameDTO.getAwayScore(), inning, InningStatus.BOTTOM, halfInningGameDTO.getScoreId());
            Score score = new Score(gameScoreDTO.getId(), gameScoreDTO.getHomeTeam(), gameScoreDTO.getAwayTeam(), attackScore, gameScoreDTO.getAwayScore());
            gameRepository.save(game);
            scoreRepository.save(score);
        }

        return new PlayGameDTO(gameScoreDTO, halfInningGameDTO, pitcherDTO, hitterDTO, ballCountDTOS);

    }


}
