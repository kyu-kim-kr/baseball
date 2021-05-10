//
//  GameViewModel.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation

class GameViewModel {
    
    @Published var game: Game!
    private var path: String
    private var inning: Int
    private var inningStatus: String
    private var fetchGameUseCase: FetchingGameUseCase
    
    init(path: String, inning: Int, inningStatus: String, fetchgame: FetchingGameUseCase) {
        self.path = path
        self.inning = inning
        self.inningStatus = inningStatus
        self.fetchGameUseCase = FetchingGameUseCase()
        fetchGameViewModel()
    }
    
    func fetchGameViewModel() {
        fetchGameUseCase.fetchGame(path: path, inning: inning, inningStatus: inningStatus, completion: { game in
            self.game = game
        })
    }
}
