//
//  GameEntity.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation

struct GameList{
    var gameNo: String
    var homeTeam: String
    var awayTeam: String
}

struct Game {
    var id: Int
    var home: String
    var away: String
    var homeScore: Int
    var awayScore: Int
    var inning: Int // 몇회
    var inningStatus: String // 초, 말
    var hitter: Player?
    var pitcher: Player?
    var ballCount: [BallCount]
    
    init() {
        self.id = 0
        self.home = ""
        self.away = ""
        self.homeScore = 0
        self.awayScore = 0
        self.inning = 0
        self.inningStatus = ""
        self.hitter = nil
        self.pitcher = nil
        self.ballCount = []
    }
    
    init(id: Int, home: String, away: String, homeScore: Int, awayScore: Int, inning: Int, inningStatus: String,
         hitter: Player, pitcher: Player, ballCount: [BallCount]) {
        self.id = id
        self.home = home
        self.away = away
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.inning = inning
        self.inningStatus = inningStatus
        self.hitter = hitter
        self.pitcher = pitcher
        self.ballCount = ballCount
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
    var hit: Bool
    var gameId: Int
}
