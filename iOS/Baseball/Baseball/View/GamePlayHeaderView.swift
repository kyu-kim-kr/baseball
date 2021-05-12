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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(away: String, home: String, awayScore: Int, homeScore: Int) {
        self.awayLabel.text = away
        self.homeLabel.text = home
        self.awayScoreLabel.text = "\(awayScore)"
        self.homeScoreLabel.text = "\(homeScore)"
    }
    
//    var header: Game? {
//        didSet {
//            self.awayLabel.text = header?.away
//            self.homeLabel.text = header?.home
//            self.awayScoreLabel.text = "\(header?.awayScore)"
//            self.homeScoreLabel.text = "\(header?.homeScore)"
//        }
}

