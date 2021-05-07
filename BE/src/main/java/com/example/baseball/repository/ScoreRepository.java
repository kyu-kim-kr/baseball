package com.example.baseball.repository;

import com.example.baseball.entity.Score;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface ScoreRepository extends CrudRepository<Score, Long> {
    Optional<Score> findByHomeTeamAndAwayTeam(String homeTeam, String awayTeam);
}
