package com.example.baseball.repository;

import com.example.baseball.entity.Player;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PlayerRepository extends CrudRepository<Player, String> {
    List<Player> findPlayersByTeamNameAndBattingIsTrue(String teamName);
}
