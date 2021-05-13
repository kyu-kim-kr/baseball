//
//  PlayerInformationCell.swift
//  Baseball
//
//  Created by sonjuhyeong on 2021/05/07.
//

import UIKit

class PlayerInformationCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var atBatLabel: UILabel!
    @IBOutlet weak var hitLabel: UILabel!
    @IBOutlet weak var outLabel: UILabel!
    @IBOutlet weak var battingAverageLabel: UILabel!
    
    static let identifier = "PlayerInformationCell"
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var player: Player? {
        didSet {
            guard let atBat = player?.atBat,
                  let hits = player?.hits,
                  let out = player?.out,
                  let average = player?.battingAverage else {
                return
            }
            
            self.nameLabel.text = player?.name
            self.atBatLabel.text = "\(atBat)"
            self.hitLabel.text = "\(hits)"
            self.outLabel.text = "\(out)"
            self.battingAverageLabel.text = "\(average)"
        }
    }
}
