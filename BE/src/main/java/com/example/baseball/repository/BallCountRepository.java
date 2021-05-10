package com.example.baseball.repository;

import com.example.baseball.entity.BallCount;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BallCountRepository extends CrudRepository<BallCount, Long> {
    @Override
    List<BallCount> findAll();

    @Query("SELECT * FROM `ball_count` " +
            "WHERE game_id = :gameId")
//    @Query("SELECT `BALL_COUNT`.`ID` AS `ID`, `BALL_COUNT`.`BALL` AS `BALL`,`BALL_COUNT`.`IS_HIT` AS `IS_HIT`, `BALL_COUNT`.`GAME_ID` AS `GAME_ID`  FROM BALL_COUNT WHERE game_id = :gameId")
    List<BallCount> findAllByGameId(Long gameId);
}
