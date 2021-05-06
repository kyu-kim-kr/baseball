package com.example.baseball.repository;

import com.example.baseball.entity.Player;
import org.springframework.data.repository.CrudRepository;

public interface PlayerRepository extends CrudRepository<Player, String> {
}
