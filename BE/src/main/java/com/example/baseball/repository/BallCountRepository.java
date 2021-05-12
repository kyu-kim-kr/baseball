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

    @Query("select * from `ball_count` " +
            "WHERE game_id = :gameId")
    List<BallCount> findAllByGameId(Long gameId);

    @Query("select * from `ball_count` " +
            "WHERE ball = :ball AND player_name = :playerName AND game_id = :gameId")
    List<BallCount> findAllByBallAndPlayerNameAndGameId(String playerName, Sbo ball, Long gameId);

    @Query("SELECT * " +
            "FROM ball_count " +
            "WHERE game_id = :gameId AND player_name = :playerName AND ball = :ball ")
    List<BallCount> countBallCountsByBallAndPlayerName(String playerName, Sbo ball, Long gameId);

    Integer countAllByBallAndPlayerNameAndGameId(String playerName, Sbo ball, Long gameId);
    //Integer countByBallAndPlayerNameAndGameId

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
