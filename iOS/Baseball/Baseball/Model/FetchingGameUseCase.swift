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
    
    func fetchGame(path: String, inning: Int, inningStatus: String,
                   completion: @escaping (Game?)->Void) {
        let endPoint = GamePlayAPIEndPoint(path: path, inning: inning, inningStatus: inningStatus, httpMethod: HttpMethod.get)
        network.request(with: endPoint, dataType: GameDTO.self)
            .sink { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { (game) in
                completion(game.toDomain())
            }
            .store(in: &subscriptions)
        }
    
    func alertError(error: Error) -> Error {
        return error
    }
}
