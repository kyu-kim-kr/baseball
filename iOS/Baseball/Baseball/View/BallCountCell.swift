//
//  BallCountCell.swift
//  Baseball
//
//  Created by sonjuhyeong on 2021/05/07.
//

import UIKit

class BallCountCell: UITableViewCell {

    static let identifier = "BallCountCell"
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var ballLabel: UILabel!
    @IBOutlet weak var strikeCountLabel: UILabel!
    @IBOutlet weak var ballCountLabel: UILabel!
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var ballCount: BallCount? {
        didSet {
            self.countLabel.text = String(ballCount?.id ?? 0)
            self.ballLabel.text = ballCount?.ball
        }
    }
    
    func configureBallCount(ballCount: [Int]) {
        self.strikeCountLabel.text = "\(ballCount[0])"
        self.ballCountLabel.text = "\(ballCount[1])"
    }
}
