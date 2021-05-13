//
//  EndPoint.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation

protocol Requestable {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HttpMethod { get }
    func url() -> URL?
}

public struct GameListAPIEndPoint: Requestable {
    public let baseURL = "http://3.36.54.59/matchList"
    public let path: String
    public let httpMethod: HttpMethod
    
    init(path: String, httpMethod: HttpMethod) {
        self.path = path
        self.httpMethod = httpMethod
    }
    
    public func url() -> URL? {
        return URL(string: baseURL + path)
    }
}

public struct GamePlayAPIEndPoint: Requestable {
    public let baseURL = "http://3.36.54.59/game/"
    public let path: String
    public let httpMethod: HttpMethod
    
    init(gameId: Int, turn: String, inning: Int, inningStatus: String, httpMethod: HttpMethod) {
        self.path = "\(gameId)/" + "\(turn)/" + "\(inning)/" + inningStatus
        self.httpMethod = httpMethod
    }
    
    public func url() -> URL? {
        return URL(string: baseURL + path)
    }
}

public struct GameDetailScoreAPIEndPoint: Requestable {
    public let baseURL = "http://3.36.54.59/detail/"
    public let path: String
    public let httpMethod: HttpMethod
    
    init(path: String, teamName: String, httpMethod: HttpMethod) {
        self.path = "\(path)/" + teamName
        self.httpMethod = httpMethod
    }
    
    public func url() -> URL? {
        return URL(string: baseURL + path)
    }
}
