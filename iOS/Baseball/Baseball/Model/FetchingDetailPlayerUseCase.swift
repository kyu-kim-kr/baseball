//
//  FetchingDetailPlayerUseCase.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/13.
//

import Foundation
import Combine

class FetchingDetailPlayerUseCase {
    private var network: Network
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.network = Network()
    }

    func fetchDetailPlayer(path: String, teamName: String,
                   completion: @escaping (Result<DetailPlayer, Error>) -> Void) {
        
        let endPoint = GameDetailScoreAPIEndPoint(path: path,
                                           teamName: teamName,
                                           httpMethod: HttpMethod.get)
        
        network.request(with: endPoint, dataType: DetailPlayerDTO.self)
            .sink { (result) in
                if case .failure(let error) = result {
                    completion(.failure(error))
                }
            } receiveValue: { (detailPlayerDTO) in
                completion(.success(detailPlayerDTO.toDomain()))
            }
            .store(in: &subscriptions)
        }
}
