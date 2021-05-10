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

    @Query("SELECT * FROM `player`\n" +
            "WHERE position = 'pitcher' AND team_name = :teamName")
    Optional<Player> findPlayerByTeamNameAndPositionIsPitcher(String teamName);

    @Query("SELECT * FROM `player`\n" +
            "WHERE position = 'hitter' AND team_name = :teamName AND is_batting = false ORDER BY batting_order ASC limit 1")
    Optional<Player> findPlayerByTeamNameAndPositionAndBattingIsFalseAndBattingOrder(String teamName);
}
