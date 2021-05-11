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
    
//    func fetchGameViewModel() {
//        fetchGameUseCase.fetchGame(path: path, inning: inning, inningStatus: inningStatus, completion: { game in
//            self.game = game
//        })
//    }
}
