//
//  FetchGameList.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import Foundation
import Combine

class FetchingGameListUseCase {
    
    private var network: Network
    private var requestable: Requestable
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.network = Network()
        self.requestable = GameListAPIEndPoint(path: "", httpMethod: .get)
    }
    

    func fetchGameList(completion: @escaping (Result<[GameList], Error>)->Void) {
        network.request(with: requestable, dataType: GameListDTO.self)
            .sink { (result) in
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    break
                }
            } receiveValue: { (gameList) in
                completion(.success(gameList.toDomain()))
            }
            .store(in: &subscriptions)
    }
}

