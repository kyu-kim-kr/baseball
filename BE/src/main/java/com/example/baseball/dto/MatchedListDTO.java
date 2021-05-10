package com.example.baseball.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class MatchedListDTO {
    @JsonProperty("matchList")
    List<MatchedTeamDTO> matchedTeamDTOS;

    public MatchedListDTO(List<MatchedTeamDTO> matchedTeamDTOS) {
        this.matchedTeamDTOS = matchedTeamDTOS;
    }

    public List<MatchedTeamDTO> getMatchedTeamDTOS() {
        return matchedTeamDTOS;
    }

    public static MatchedListDTO of(List<MatchedTeamDTO> matchedTeamDTOS) {
        return new MatchedListDTO(matchedTeamDTOS);
    }

}
