package com.example.baseball.repository;

import com.example.baseball.entity.BallCount;
import com.example.baseball.entity.Sbo;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface BallCountRepository extends CrudRepository<BallCount, Long> {
    @Override
    List<BallCount> findAll();

    @Query("SELECT `BALL_COUNT`.`ID` AS `ID`, `BALL_COUNT`.`BALL` AS `BALL`, `BALL_COUNT`.`GAME_ID` AS `GAME_ID`, `BALL_COUNT`.`PLAYER_NAME` AS `PLAYER_NAME` FROM `BALL_COUNT` " +
            "WHERE game_id = :gameId")
    List<BallCount> findAllByGameId(Long gameId);

    @Query("SELECT `BALL_COUNT`.`ID` AS `ID`, `BALL_COUNT`.`BALL` AS `BALL`, `BALL_COUNT`.`GAME_ID` AS `GAME_ID`, `BALL_COUNT`.`PLAYER_NAME` AS `PLAYER_NAME` FROM `BALL_COUNT` " +
            "WHERE ball = :ball AND player_name = :playerName AND game_id = :gameId")
    List<BallCount> findAllByBallAndPlayerNameAndGameId(String playerName, Sbo ball, Long gameId);

    @Query("SELECT * " +
            "FROM ball_count " +
            "WHERE game_id = :gameId AND player_name = :playerName AND ball = :ball ")
    List<BallCount> countBallCountsByBallAndPlayerName(String playerName, Sbo ball, Long gameId);

    @Query("SELECT * " +
            "FROM ball_count " +
            "WHERE game_id = :gameId AND ball = :ball " )
    List<BallCount> checkScore(Sbo ball, Long gameId);

    @Transactional
    @Modifying
    @Query("delete from ball_count where ball = :ball and player_name = :playerName and game_id = :gameId")
    void deleteBallCountsByBallAndPlayerNameAndGameId(String playerName, Sbo ball, Long gameId);

    @Transactional
    @Modifying
    @Query("INSERT INTO ball_count(player_name, ball, game_id)  values(:playerName, :ball, :gameId)")
    void insertNewBallCount(String playerName, Sbo ball, Long gameId);

}
