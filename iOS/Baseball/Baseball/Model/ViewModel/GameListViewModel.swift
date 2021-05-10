//
//  GameListViewModel.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation

class GameListViewModel {
    @Published var gameList: [GameList]
    private var fetchGameList: FetchGameList
    
    init() {
        self.gameList = []
        self.fetchGameList = FetchGameList()
        fetchGameListViewModel()
    }
    
    func fetchGameListViewModel() {
        fetchGameList.fetchGameList(completion: { result in
            self.gameList = result.gameList
        })
    }
    
    func getGameList(indexPath: IndexPath) -> GameList? {
        guard let count = gameList.count
        return
    }
    
    func count() -> Int {
        return gameList.count
    }
}
