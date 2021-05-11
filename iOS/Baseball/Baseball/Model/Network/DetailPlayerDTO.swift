//
//  DetailPlayerDTO.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/10.
//

import Foundation

class DetailPlayerDTO: Decodable {
    private (set) var gameScoreResponseDTO: GameScoreResponseDTO
    private (set) var halfInningGameResponseDTO: GameInformationDTO
    private (set) var playerListDTO: PlayerListDTO
}
