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
    public let baseURL = "http://ec2-52-78-16-203.ap-northeast-2.compute.amazonaws.com/matchList"
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
    public let baseURL = "http://ec2-52-78-16-203.ap-northeast-2.compute.amazonaws.com/game/"
    public let path: String
    public let httpMethod: HttpMethod
    
    init(path: String, inning: Int, inningStatus: String, httpMethod: HttpMethod) {
        self.path = path + "/\(inning)/" + inningStatus
        self.httpMethod = httpMethod
    }
    
    public func url() -> URL? {
        return URL(string: baseURL + path)
    }
}

public struct GameDetailScoreAPIEndPoint: Requestable {
    public let baseURL = "http://ec2-52-78-16-203.ap-northeast-2.compute.amazonaws.com/detail/"
    public let path: String
    public let httpMethod: HttpMethod
    
    init(path: String, gameId: Int, Team: String, httpMethod: HttpMethod) {
        self.path = "/(gameId)/" + Team
        self.httpMethod = httpMethod
    }
    
    public func url() -> URL? {
        return URL(string: baseURL + path)
    }
}
