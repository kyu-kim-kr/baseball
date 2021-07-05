package com.example.baseball.repository;

import com.example.baseball.entity.Game;
import com.example.baseball.entity.InningStatus;
import com.example.baseball.entity.Sbo;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface GameRepository extends CrudRepository<Game, Long> {
    @Override
    List<Game> findAll();

    Optional<Game> findById(Long id);

    List<Game> findGamesByAwayTeam(String awayTeam);

    List<Game> findGamesByHomeTeam(String homeTeam);

    Optional<Game> findGameByInningAndInningStatus(Integer inning, InningStatus inningStatus);

    @Modifying
    @Query("UPDATE game " +
            "SET home_score = false " +
            "WHERE position = 'hitter' AND team_name = :teamName")
    void updateAttackTeamScore(String teamName);

    @Query("select * from game \n" +
            "where inning = :inning and inning_status =:inningStatus")
    Optional<Game> findGameByInningAndInningStatus(Integer inning, String inningStatus);

}

