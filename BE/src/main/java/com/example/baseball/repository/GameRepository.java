package com.example.baseball.repository;

import com.example.baseball.entity.Game;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface GameRepository extends CrudRepository<Game, Long> {
    @Query("SELECT `GAME`.`ID` AS `ID`,`GAME`.`HOME_TEAM` AS `HOME_TEAM`, `GAME`.`AWAY_TEAM` AS `AWAY_TEAM`  FROM `GAME` ")
    @Override
    List<Game> findAll();

    @Query("SELECT `GAME`.`ID` AS `ID`, `GAME`.`HOME_TEAM` AS `HOME_TEAM`, `GAME`.`AWAY_TEAM` AS `AWAY_TEAM`  FROM `GAME` WHERE `GAME`.`ID` = :id")
    Optional<Game> findById(Long id);

    List<Game> findGamesByAwayTeam(String awayTeam);

    List<Game> findGamesByHomeTeam(String homeTeam);
}
