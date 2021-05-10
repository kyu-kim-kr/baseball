//
//  GameEntity.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation

struct GameList: Decodable {
    //var gameNo: String
    var id: Int
    var homeTeam: String
    var awayTeam: String
}

struct Game: Decodable {
    var id: Int
    var home: String
    var away: String
    var homeScore: Int
    var awayScore: Int
    var inning: Int // 몇회
    var inningStatus: String // 초, 말
    var players: [Player]
    var ballCount: [BallCount]
}

struct Team: Decodable {
    var name: String
    var players: [Player]
}

struct Player: Decodable {
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
}

struct BallCount: Decodable {
    var id: Int
    var ball: String
    var hit: Bool
    var gameId: Int
}
