//
//  GameTabBarController.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/13.
//

import UIKit

class GameTabBarController: UITabBarController {
    
    var gameId: Int?
    var turn: String?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configure(gameId: Int, turn: String) {
        self.gameId = gameId
        self.turn = turn
    }
}
