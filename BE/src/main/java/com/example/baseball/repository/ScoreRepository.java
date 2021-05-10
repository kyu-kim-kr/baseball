package com.example.baseball.repository;

import com.example.baseball.entity.Score;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface ScoreRepository extends CrudRepository<Score, Long> {

    List<Score> findAll();
    Optional<Score> findByHomeTeamAndAwayTeam(String homeTeam, String awayTeam);
}
