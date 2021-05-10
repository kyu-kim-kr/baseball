package com.example.baseball.repository;

import com.example.baseball.entity.Player;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface PlayerRepository extends CrudRepository<Player, String> {
    List<Player> findPlayersByTeamName(String teamName);

    @Override
    List<Player> findAll();

    @Query("SELECT `PLAYER`.`NAME` AS `NAME`, `PLAYER`.`POSITION` AS `POSITION`, `PLAYER`.`AT_BAT` AS `AT_BAT`, `PLAYER`.`HITS` AS `HITS`, `PLAYER`.`OUT` AS `OUT`, `PLAYER`.`BATTING_AVERAGE` AS `BATTING_AVERAGE`, `PLAYER`.`NUMBER_OF_PITCHES` AS `NUMBER_OF_PITCHES`, `PLAYER`.`TEAM_NAME` AS `TEAM_NAME`, `PLAYER`.`BATTING_ORDER` AS `BATTING_ORDER`, `PLAYER`.`IS_BATTING` AS `IS_BATTING` FROM `PLAYER`\n" +
            "WHERE position = 'pitcher' AND team_name = :teamName")
    Optional<Player> findPlayerByTeamNameAndPositionIsPitcher(String teamName);

    @Query("SELECT `PLAYER`.`NAME` AS `NAME`, `PLAYER`.`POSITION` AS `POSITION`, `PLAYER`.`AT_BAT` AS `AT_BAT`, `PLAYER`.`HITS` AS `HITS`, `PLAYER`.`OUT` AS `OUT`, `PLAYER`.`BATTING_AVERAGE` AS `BATTING_AVERAGE`, `PLAYER`.`NUMBER_OF_PITCHES` AS `NUMBER_OF_PITCHES`, `PLAYER`.`TEAM_NAME` AS `TEAM_NAME`, `PLAYER`.`BATTING_ORDER` AS `BATTING_ORDER`, `PLAYER`.`IS_BATTING` AS `IS_BATTING` FROM `PLAYER`\n" +
            "WHERE position = 'hitter' AND team_name = :teamName AND is_batting = false ORDER BY batting_order ASC limit 1")
    Optional<Player> findPlayerByTeamNameAndPositionAndBattingIsFalseAndBattingOrder(String teamName);
}
