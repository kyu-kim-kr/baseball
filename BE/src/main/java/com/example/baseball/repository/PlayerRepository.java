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

//    Optional<Player> findPlayerByTeamNameAndPositionIsPitcher(String teamName, String position);

//    Optional<Player> findPlayerByTeamNameAndPositionAndBattingIsFalseAndBattingOrder();
}
