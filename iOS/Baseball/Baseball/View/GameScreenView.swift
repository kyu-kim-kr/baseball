//
//  GameScreenView.swift
//  Baseball
//
//  Created by sonjuhyeong on 2021/05/10.
//

import UIKit

class GameScreenView: UIView {

    @IBOutlet var strikeCount: [UIView]!
    @IBOutlet var ballCount: [UIView]!
    @IBOutlet var outCount: [UIView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCount()
    }
    
    func setupCount()  {
        for strike in strikeCount {
            strike.layer.masksToBounds = true
            strike.layer.borderWidth = 1
            strike.layer.cornerRadius = 15
        }
        for ball in ballCount {
            ball.layer.masksToBounds = true
            ball.layer.borderWidth = 1
            ball.layer.cornerRadius = 15
        }
        for out in outCount {
            out.layer.masksToBounds = true
            out.layer.borderWidth = 1
            out.layer.cornerRadius = 15
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpLayer()
    }
    
    func setUpLayer()  {
        let width = self.frame.width
        let height = self.frame.height
        makeBaseLine(width: width, height: height)
        makeHomeBase(width: width, height: height)
        makeFirstBase(width: width, height: height)
        makeSecondBase(width: width, height: height)
        makeThirdBase(width: width, height: height)
    }

    func makeBaseLine(width: CGFloat, height: CGFloat) {
        let linePath = UIBezierPath()
        linePath.lineWidth = 3
        linePath.move(to: CGPoint(x: width / 2, y: height - (height / 5)))
        linePath.addLine(to: CGPoint(x: width - (width / 5), y: height / 2 ))
        linePath.addLine(to: CGPoint(x: width / 2, y: height - (height * 4/5)))
        linePath.addLine(to: CGPoint(x: width - (width * 4/5), y: height / 2))
        linePath.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = linePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.systemGray.cgColor
        layer.addSublayer(shapeLayer)
    }
    
    func makeHomeBase(width: CGFloat, height: CGFloat) {
        let homeBasePath = UIBezierPath()
        homeBasePath.move(to: CGPoint(x: width / 2, y: height - (height / 5) - 20))
        homeBasePath.addLine(to: CGPoint(x: width / 2 - 20, y: height - (height / 5)))
        homeBasePath.addLine(to: CGPoint(x: width / 2 - 20, y: height - (height / 5) + 20))
        homeBasePath.addLine(to: CGPoint(x: width / 2 + 20, y: height - (height / 5) + 20))
        homeBasePath.addLine(to: CGPoint(x: width / 2 + 20, y: height - (height / 5)))
        homeBasePath.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = homeBasePath.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(shapeLayer)
    }

    func makeFirstBase(width: CGFloat, height: CGFloat) {
        let firstBasePath = UIBezierPath()
        firstBasePath.move(to: CGPoint(x: width - (width / 5) - 15, y: height / 2))
        firstBasePath.addLine(to: CGPoint(x: width - (width / 5), y: (height / 2) - 15))
        firstBasePath.addLine(to: CGPoint(x: width - (width / 5) + 15, y: height / 2))
        firstBasePath.addLine(to: CGPoint(x: width - (width / 5), y: (height / 2) + 15))
        firstBasePath.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = firstBasePath.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(shapeLayer)
    }

    func makeSecondBase(width: CGFloat, height: CGFloat) {
        let secondBasePath = UIBezierPath()
        secondBasePath.move(to: CGPoint(x: width / 2, y: height - (height * 4/5) - 15))
        secondBasePath.addLine(to: CGPoint(x: (width / 2) - 15, y: height - (height * 4/5)))
        secondBasePath.addLine(to: CGPoint(x: width / 2, y: height - (height * 4/5) + 15))
        secondBasePath.addLine(to: CGPoint(x: (width / 2) + 15, y: height - (height * 4/5)))
        secondBasePath.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = secondBasePath.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(shapeLayer)
    }

    func makeThirdBase(width: CGFloat, height: CGFloat) {
        let thirdBasePath = UIBezierPath()
        thirdBasePath.move(to: CGPoint(x: width - (width * 4/5) + 15, y: height / 2))
        thirdBasePath.addLine(to: CGPoint(x: width - (width * 4/5), y: (height / 2) - 15))
        thirdBasePath.addLine(to: CGPoint(x: width - (width * 4/5) - 15, y: height / 2))
        thirdBasePath.addLine(to: CGPoint(x: width - (width * 4/5), y: (height / 2) + 15))
        thirdBasePath.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = thirdBasePath.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(shapeLayer)
    }
    
}
