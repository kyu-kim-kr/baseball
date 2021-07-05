package com.example.baseball.repository;

import com.example.baseball.entity.Score;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface ScoreRepository extends CrudRepository<Score, Long> {

    Optional<Score> findById(Long id);

    List<Score> findAll();
    Optional<Score> findByHomeTeamAndAwayTeam(String homeTeam, String awayTeam);

    @Query("SELECT * FROM score " +
            "WHERE home_team = :homeTeam")
    Optional<Score> findScoreByHomeTeam(String homeTeam);

    @Query("SELECT * FROM score " +
            "WHERE away_team = :awayTeam")
    Optional<Score> findScoreByAwayTeam(String awayTeam);
}
