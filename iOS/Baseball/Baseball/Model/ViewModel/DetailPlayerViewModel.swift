//
//  DetailPlayerViewModel.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/13.
//

import Foundation
import Combine

class DetailPlayerViewModel {
    
    @Published var detailPlayer: DetailPlayer
    @Published var errorMessage: String
    var path: String
    var teamName: String
    
    private var fetchDetailPlayerUseCase: FetchingDetailPlayerUseCase

    init() {
        self.path = "away"
        self.teamName = "Captain"
        self.detailPlayer = DetailPlayer()
        self.errorMessage = ""
        self.fetchDetailPlayerUseCase = FetchingDetailPlayerUseCase()
        request()
    }
    
    func request() {
        fetchDetailPlayerUseCase.fetchDetailPlayer(path: path, teamName: teamName) { (result) in
                switch result {
                case .failure(let error):
                    self.errorMessage = "\(error)"
                case .success(let detailPlayer):
                    self.detailPlayer = detailPlayer
                }
        }
    }
    
    func fetchDetailPlayer() -> AnyPublisher<DetailPlayer, Never> {
        return $detailPlayer
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func except() -> AnyPublisher<String, Never> {
        return $errorMessage
            .dropFirst()
            .eraseToAnyPublisher()
    }
    
    func count() -> Int {
        detailPlayer.players.count
    }
    
    func getPlayer(indexPath: IndexPath) -> Player {
        return detailPlayer.players[indexPath.row]
    }
}
