//
//  GameListViewModel.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation

class GameListViewModel {
    @Published var gameList: [GameList]
    private var fetchGameListUseCase: FetchingGameListUseCase
    
    init() {
        self.gameList = []
        self.fetchGameListUseCase = FetchingGameListUseCase()
        fetchGameListViewModel()
    }
    
    func fetchGameListViewModel() {
        fetchGameListUseCase.fetchGameList(completion: { result in
            self.gameList = result ?? []
        })
    }
    
    func getGameList(indexPath: IndexPath) -> GameList? {
        return gameList.count == 0 ? nil : gameList[indexPath.row]
    }
    
    func count() -> Int {
        return gameList.count
    }
}
