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
    
    var header: Game? {
        didSet {
            self.awayLabel.text = header?.away
            self.homeLabel.text = header?.home
            guard let awayScore = header?.awayScore,
                  let homeScore = header?.homeScore else {
                return
            }
            self.awayScoreLabel.text = "\(awayScore)"
            self.homeScoreLabel.text = "\(homeScore)"
        }
    }
}

