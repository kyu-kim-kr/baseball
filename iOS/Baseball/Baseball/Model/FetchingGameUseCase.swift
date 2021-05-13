//
//  FetchGame.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation
import Combine

class FetchingGameUseCase {
    
    private var network: Network
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.network = Network()
    }
    
    func fetchGame(gameId: Int, turn: String, inning: Int, inningStatus: String, httpMethod: HttpMethod,
                   completion: @escaping (Result<Game, Error>) -> Void) {
        
        let endPoint = GamePlayAPIEndPoint(gameId: gameId,
                                           turn: turn,
                                           inning: inning,
                                           inningStatus: inningStatus,
                                           httpMethod: httpMethod)
        
        network.request(with: endPoint, dataType: GameDTO.self)
            .sink { (result) in
                if case .failure(let error) = result {
                    completion(.failure(error))
                }
            } receiveValue: { (game) in
                completion(.success(game.toDomain()))
            }
            .store(in: &subscriptions)
    }
}
