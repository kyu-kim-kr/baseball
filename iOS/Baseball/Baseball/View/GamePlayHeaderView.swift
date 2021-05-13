//
//  GamePlayHeaderView.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/12.
//

import UIKit

class GamePlayHeaderView: UIView {

    @IBOutlet weak var awayLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    
//    var header: GameInformation? {
//        didSet {
//            self.awayLabel.text = header?.awayTeam
//            self.homeLabel.text = header?.homeTeam
//            guard let awayScore = header?.awayScore,
//                  let homeScore = header?.homeScore else {
//                return
//            }
//            self.awayScoreLabel.text = "\(awayScore)"
//            self.homeScoreLabel.text = "\(homeScore)"
//        }
//    }
    func configure(game: Game) {
        self.awayLabel.text = game.awayTeam
        self.homeLabel.text = game.homeTeam
        self.awayScoreLabel.text = "\(game.awayScore)"
        self.homeScoreLabel.text = "\(game.homeScore)"
    }
    
    func configure2(gameInformaion: GameInformation) {
        self.awayLabel.text = gameInformaion.awayTeam
        self.homeLabel.text = gameInformaion.homeTeam
        self.awayScoreLabel.text = "\(gameInformaion.awayScore)"
        self.homeScoreLabel.text = "\(gameInformaion.homeScore)"
    }
}

