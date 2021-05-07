package com.example.baseball.repository;

import com.example.baseball.entity.BallCount;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BallCountRepository extends CrudRepository<BallCount, Long> {
    List<BallCount> findAll();
}
