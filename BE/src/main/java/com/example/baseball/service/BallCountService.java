package com.example.baseball.service;

import com.example.baseball.dto.BallCountDTO;
import com.example.baseball.entity.BallCount;
import com.example.baseball.entity.Sbo;
import com.example.baseball.repository.BallCountRepository;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BallCountService {

    private final BallCountRepository ballCountRepository;

    public BallCountService(BallCountRepository ballCountRepository) {
        this.ballCountRepository = ballCountRepository;
    }

    @Transactional
    public void updateFourBallOrThreeStrike(String playerName, Long gameId) {

        List<BallCount> countOfBalls = ballCountRepository.countBallCountsByBallAndPlayerName(playerName, Sbo.BALL.toString(), gameId);
        int countOfBall = countOfBalls.size();
        List<BallCount> countOfStrikes = ballCountRepository.countBallCountsByBallAndPlayerName(playerName, Sbo.STRIKE.toString(), gameId);
        int countOfStrike = countOfStrikes.size();

        if(countOfBall == 4) {
            ballCountRepository.deleteBallCountsByBallAndPlayerNameAndGameId(playerName, Sbo.BALL.toString(), gameId);
            ballCountRepository.save(new BallCount(playerName, Sbo.HIT, gameId));

        }
        if(countOfStrike == 3) {
            ballCountRepository.deleteBallCountsByBallAndPlayerNameAndGameId(playerName, Sbo.HIT.toString(), gameId);
            ballCountRepository.save(new BallCount(playerName, Sbo.OUT, gameId));
        }
    }

    @Transactional
    public int checkScore(Long gameId) {

        List<BallCount> ballCounts = ballCountRepository.checkScore(Sbo.HIT.toString(), gameId);
        int hitNumber = ballCounts.size();

        if (hitNumber >= 4) {
            return hitNumber - 3;
        }
        return 0;
    }





}
