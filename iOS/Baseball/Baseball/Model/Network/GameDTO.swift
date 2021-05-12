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
    private (set) var players: [Player]
    private (set) var ballCounts: [BallCount]
}

extension GameDTO {
    func toDomain() -> Game {
        return .init(id: halfInningGameResponseDTO.id,
                     home: halfInningGameResponseDTO.homeTeam,
                     away: halfInningGameResponseDTO.awayTeam,
                     homeScore: halfInningGameResponseDTO.homeScore,
                     awayScore: halfInningGameResponseDTO.awayScore,
                     inning: halfInningGameResponseDTO.inning,
                     inningStatus: halfInningGameResponseDTO.inningStatus, players: players,
                     ballCount: ballCounts)
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

struct PlayerDTO: Decodable {
    private (set) var name: String
    private (set) var teamName: String
    private (set) var position: String // 포지션
    private (set) var atBat: Int // 타석
    private (set) var hits: Int // 안타
    private (set) var out: Int // 아웃
    private (set) var battingAverage: Double // 타율
    private (set) var numberOfPitches: Int // 투구수
    private (set) var battingOrder: Int
    private (set) var batting: Bool
    
//    func toDomain() -> Player {
//        return .init(name: name, teamName: teamName, position: position, atBat: atBat, hits: hits, out: out, battingAverage: battingAverage, numberOfPitches: numberOfPitches, battingOrder: battingOrder, batting: batting)
//    }
    
    func toDomain(playersDTO: [PlayerDTO]) -> [Player] {
        let players = playersDTO.map { playerDTO in
            Player(name: name, teamName: teamName, position: position, atBat: atBat, hits: hits, out: out, battingAverage: battingAverage, numberOfPitches: numberOfPitches, battingOrder: battingOrder, batting: batting)
        }
        return players
    }
}

struct BallDTO: Decodable {
    private (set) var id: Int
    private (set) var ball: String
    private (set) var hit: Bool
    private (set) var gameId: Int
    
    func toDomain() -> BallCount {
        return .init(id: id, ball: ball, hit: hit, gameId: gameId)
    }
}
