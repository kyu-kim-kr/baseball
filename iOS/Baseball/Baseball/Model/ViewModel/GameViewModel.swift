//
//  GameViewModel.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation
import Combine

class GameViewModel {
    
    @Published var game: Game!
    @Published var errorMessage: String
    private var path: String
    private var inning: Int
    private var inningStatus: String
    private var fetchGameUseCase: FetchingGameUseCase
    
    init(path: String, inning: Int, inningStatus: String, fetchgame: FetchingGameUseCase) {
        self.game = Game()
        self.errorMessage = ""
        self.path = path
        self.inning = inning
        self.inningStatus = inningStatus
        self.fetchGameUseCase = FetchingGameUseCase()
        request()
    }
    
    convenience init() {
        self.init(path: "attack", inning: 1, inningStatus: "TOP", fetchgame: FetchingGameUseCase())
    }
    
    func request() {
        fetchGameUseCase.fetchGame(path: path, inning: inning, inningStatus: inningStatus) { (result) in
            switch result {
            case .failure(let error):
                self.errorMessage = "\(error)"
            case .success(let game):
                self.game = game
            }
        }
    }
    
    func fetchGame() -> AnyPublisher<Game?, Never> {
        return $game
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func except() -> AnyPublisher<String, Never> {
        return $errorMessage
            .dropFirst()
            .eraseToAnyPublisher()
    }
    
    func ballCount() -> Int {
        return game.ballCount.count ?? 0
    }
    
    func calculateBallCount() -> [Int] {
        var ballCount = [0,0,0]
        
        game.ballCount.forEach {
            if $0.ball == "STRIKE" {
                ballCount[0] += 1
                if ballCount[0] == 3 {
                    ballCount[2] += 1
                }
            } else {
                ballCount[1] += 1
            }
            
            if ballCount[2] == 3 {
                // 3out 공수교대 요청
            }
        }
        return ballCount
    }
}
