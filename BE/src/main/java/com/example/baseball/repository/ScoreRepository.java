package com.example.baseball.repository;

import com.example.baseball.entity.Score;
import org.springframework.data.repository.CrudRepository;

public interface ScoreRepository extends CrudRepository<Score, Long> {
}
