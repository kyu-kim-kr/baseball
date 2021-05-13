//
//  GameEntity.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation

struct GameList{
    var gameNo: Int
    var homeTeam: String
    var awayTeam: String
}

struct Game {
    var id: Int
    var homeTeam: String
    var awayTeam: String
    var homeScore: Int
    var awayScore: Int
    var inning: Int // 몇회
    var inningStatus: String // 초, 말
    var hitter: Player?
    var pitcher: Player?
    var ballCount: [BallCount]
    
    init() {
        self.id = 0
        self.homeTeam = ""
        self.awayTeam = ""
        self.homeScore = 0
        self.awayScore = 0
        self.inning = 0
        self.inningStatus = ""
        self.hitter = nil
        self.pitcher = nil
        self.ballCount = []
    }
    
    init(id: Int, homeTeam: String, awayTeam: String, homeScore: Int, awayScore: Int, inning: Int, inningStatus: String,
         hitter: Player, pitcher: Player, ballCount: [BallCount]) {
        self.id = id
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.inning = inning
        self.inningStatus = inningStatus
        self.hitter = hitter
        self.pitcher = pitcher
        self.ballCount = ballCount
    }
}

struct DetailPlayer {
    var gameInformation: [GameInformation]
    var players: [Player]
    
    init() {
        self.gameInformation = []
        self.players = []
    }
    
    init(gameInformation: [GameInformation], players: [Player]) {
        self.gameInformation = gameInformation
        self.players = players
    }
}

struct GameInformation {
    var id: Int
    var homeTeam: String
    var awayTeam: String
    var homeScore: Int
    var awayScore: Int
    var inning: Int // 몇회
    var inningStatus: String // 초, 말
    
    init() {
        self.id = 0
        self.homeTeam = ""
        self.awayTeam = ""
        self.homeScore = 0
        self.awayScore = 0
        self.inning = 0
        self.inningStatus = ""
    }
    
    init(id: Int, homeTeam: String, awayTeam: String, homeScore: Int, awayScore: Int, inning: Int, inningStatus: String) {
        self.id = id
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.inning = inning
        self.inningStatus = inningStatus
    }
    
}

struct Player {
    var name: String
    var teamName: String
    var position: String // 포지션
    var atBat: Int? // 타석
    var hits: Int? // 안타
    var out: Int? // 아웃
    var battingAverage: Double? // 타율
    var numberOfPitches: Int? // 투구수
    var battingOrder: Int?
    var batting: Bool
}

struct BallCount: Decodable {
    var id: Int
    var ball: String
    var playerName: String
    var gameId: Int
}
