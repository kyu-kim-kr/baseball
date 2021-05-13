//
//  DetailPlayerDTO.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/12.
//

import Foundation

struct DetailPlayerDTO: Decodable {
    private (set) var gameScoreResponseDTO: GameScoreDTO
    private (set) var halfInningGameDTOs: [GameInformationDTO]
    private (set) var playerResponseDTOS: [PlayerDTO]
}

extension DetailPlayerDTO {
    
    func toDomain() -> DetailPlayer {
        return .init(gameInformation: toDomainGameInformation(), players: toDomainPlayers())
    }
    
    func toDomainGameInformation() -> [GameInformation] {
        let gameInformation = halfInningGameDTOs.map { gameInfo in
            GameInformation(id: gameInfo.id, homeTeam: gameInfo.homeTeam, awayTeam: gameInfo.awayTeam,
                            homeScore: gameInfo.homeScore, awayScore: gameInfo.awayScore, inning: gameInfo.inning,
                            inningStatus: gameInfo.inningStatus)
        }
        return gameInformation
    }
    
    func toDomainPlayers() -> [Player] {
        let players = playerResponseDTOS.map{ playerDTO in
            Player(name: playerDTO.name, teamName: playerDTO.teamName, position: playerDTO.position,
                   atBat: playerDTO.atBat, hits: playerDTO.hits, out: playerDTO.out,
                   battingAverage: playerDTO.battingAverage, numberOfPitches: playerDTO.numberOfPitches,
                   battingOrder: playerDTO.battingOrder, batting: playerDTO.batting)
        }
        return players
    }
    
}
