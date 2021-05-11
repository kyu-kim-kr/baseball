//
//  GameDTO.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/10.
//

import Foundation

struct GameDTO: Decodable {
    private (set) var gameScoreResponseDTO: GameScoreResponseDTO
    private (set) var halfInningGameResponseDTO: GameInformationDTO
    private (set) var playerListDTO: PlayerListDTO
    private (set) var ballCounts: BallCountsDTO
    
    func toDomain() -> Game {
        return .init(id: halfInningGameResponseDTO.id,
                     home: halfInningGameResponseDTO.homeTeam,
                     away: halfInningGameResponseDTO.awayTeam,
                     homeScore: halfInningGameResponseDTO.homeScore,
                     awayScore: halfInningGameResponseDTO.awayScore,
                     inning: halfInningGameResponseDTO.inning,
                     inningStatus: halfInningGameResponseDTO.inningStatus, players: playerListDTO.toDomain(),
                     ballCount: ballCounts.toDomain())
    }
}

struct GameScoreResponseDTO: Decodable {
    private (set) var homeTeam: String
    private (set) var awayTeam: String
    private (set) var homeScore: Int
    private (set) var awayScore: Int
}

struct GameInformationDTO: Decodable {
    private (set) var id: Int
    private (set) var homeTeam: String
    private (set) var awayTeam: String
    private (set) var homeScore: Int
    private (set) var awayScore: Int
    private (set) var inning: Int
    private (set) var inningStatus: String
}

struct PlayerListDTO: Decodable {
    private (set) var players: [PlayerDTO]
}

extension PlayerListDTO {
    struct PlayerDTO: Decodable {
        var name: String
        var teamName: String
        var position: String // 포지션
        var atBat: String // 타석
        var hits: Int // 안타
        var out: Int // 아웃
        var battingAverage: Double // 타율
        var numberOfPitches: Int // 투구수
        var battingOrder: Int
        var batting: Bool
        
        func toDomain() -> Player {
            return .init(name: name, teamName: teamName, position: position, atBat: atBat, hits: hits, out: out, battingAverage: battingAverage, numberOfPitches: numberOfPitches, battingOrder: battingOrder, batting: batting)
        }
    }
    
    func toDomain() -> [Player] {
        let players = self.players.map({ player in
            player.toDomain()
        })
        return players
    }
}

struct BallCountsDTO: Decodable {
    private (set) var balls: [BallDTO]
}

extension BallCountsDTO {
    struct BallDTO: Decodable {
        private (set) var id: Int
        private (set) var ball: String
        private (set) var hit: Bool
        private (set) var gameId: Int
        
        func toDomain() -> BallCount {
            return .init(id: id, ball: ball, hit: hit, gameId: gameId)
        }
    }
    
    func toDomain() -> [BallCount] {
        let balls = self.balls.map { ball in
            ball.toDomain()
        }
        return balls
    }
}
