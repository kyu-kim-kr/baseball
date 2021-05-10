

import Foundation

struct GameListDTO: Decodable {
    private (set) var body: [GameListItemDTO]
}

extension GameListDTO {
    struct GameListItemDTO: Decodable {
        private let id: Int
        private let homeTeam: String
        private let awayTeam: String
        
        func toDomain() -> GameList {
            return .init(id: id, homeTeam: homeTeam, awayTeam: awayTeam)
        }
    }
    
    func toDomain() -> [GameList] {
        let gameList = self.body.map { gameListItemDTO in
            gameListItemDTO.toDomain()
        }
        return gameList
    }
}
