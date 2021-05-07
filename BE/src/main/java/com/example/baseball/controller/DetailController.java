package com.example.baseball.controller;

import com.example.baseball.dto.DetailPageDTO;
import com.example.baseball.service.DetailService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/detail")
public class DetailController {

    private final DetailService detailService;

    public DetailController(DetailService detailService) {
        this.detailService = detailService;
    }

    @GetMapping("/{gameId}/homeTeam")
    public DetailPageDTO showDetailpage(@PathVariable Long gameId) {
        return detailService.showDetailpage(gameId);
    }
}
