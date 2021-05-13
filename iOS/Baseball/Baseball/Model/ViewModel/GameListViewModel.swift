//
//  GameListViewModel.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation
import Combine

class GameListViewModel {

    @Published var gameList: [GameList]
    @Published var errorMessage: String
    private var fetchGameListUseCase: FetchingGameListUseCase

    init() {
        self.gameList = []
        self.errorMessage = ""
        self.fetchGameListUseCase = FetchingGameListUseCase()
        request()
    }
    
    func request() {
        fetchGameListUseCase.fetchGameList(completion: { result in
            switch result {
            case .failure(let error):
                self.errorMessage = "\(error)"
            case .success(let list):
                self.gameList = list
            }
        })
    }
    
    func fetchGameList() -> AnyPublisher<[GameList], Never> {
        return $gameList
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func except() -> AnyPublisher<String, Never> {
        return $errorMessage
            .dropFirst()
            .eraseToAnyPublisher()
    }
    
    func getGameList(indexPath: IndexPath) -> GameList? {
        return gameList.count == 0 ? nil : gameList[indexPath.row]
    }
    
    func count() -> Int {
        return gameList.count ?? 0
    }
}
