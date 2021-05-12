//
//  PlayingPlayerView.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/12.
//

import UIKit

class PlayerInfoView: UIView {
    @IBOutlet weak var pitcherLabel: UILabel!
    @IBOutlet weak var numberOfPitchesLabel: UILabel!
    @IBOutlet weak var pitcherTurnLabel: UILabel!
    @IBOutlet weak var batterLabel: UILabel!
    @IBOutlet weak var atBatLabel: UILabel!
    @IBOutlet weak var batterTurnLabel: UILabel!
    
    var information: Game? {
        didSet {
            self.pitcherLabel.text = information?.pitcher?.name
            self.numberOfPitchesLabel.text = configNumberOfPitches()
            
            self.batterLabel.text = information?.hitter?.name
            self.atBatLabel.text = configAtBat()
        }
    }
    
    func configNumberOfPitches() -> String {
        guard let formattingNumberOfPitches = information?.pitcher?.numberOfPitches else {
            return ""
        }
        return "#\(formattingNumberOfPitches)"
    }
    
    func configAtBat() -> String {
        guard let formattingatBat = information?.hitter?.atBat,
              let formattingHit = information?.hitter?.hits else {
            return ""
        }
        return "\(formattingatBat)타수 \(formattingHit)안타"
    }
}
