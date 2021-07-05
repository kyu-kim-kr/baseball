package com.example.baseball.repository;

import com.example.baseball.entity.Player;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface PlayerRepository extends CrudRepository<Player, String> {
    @Query("select * from `player` " +
            "WHERE position = 'hitter' AND team_name = :teamName ")
    List<Player> findHitterByTeamName(String teamName);

    @Override
    List<Player> findAll();

    @Query("select * from `player` " +
            "WHERE position = 'hitter' AND team_name = :teamName AND batting_order = :battingOrder")
    Optional<Player> findPlayerByBattingOrderAndTeamName(String teamName, Integer battingOrder);

    @Query("select * from `player` " +
            "WHERE position = 'pitcher' AND team_name = :teamName")
    Optional<Player> findPlayerByTeamNameAndPositionIsPitcher(String teamName);

    @Query("select * from `player` " +
            "WHERE position = 'hitter' AND team_name = :teamName AND is_batting = false ORDER BY batting_order ASC limit 1")
    Optional<Player> findPlayerByTeamNameAndPositionAndBattingIsFalseAndBattingOrder(String teamName);

    @Modifying
    @Query("UPDATE player " +
            "SET is_batting = false " +
            "WHERE position = 'hitter' AND team_name = :teamName")
    void updatePlayerByBattingOrderAndTeamName(String teamName);

    @Modifying
    @Query("UPDATE player " +
            "SET number_of_pitches = :numberOfPitchers " +
            "WHERE position = 'pitcher' AND team_name = :teamName")
    void updateNumberOfPitchesAtDefenseTeamPitcher(String teamName, Integer numberOfPitchers);
}
