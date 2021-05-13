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
    private var strikeNum = 0
    private var ballNum = 0
    private var outNum = 0
    
    private var batterArr: [CALayer] = []
    private var hitter = CALayer()
    private let emojiArray = ["🐶", "🐴", "🦑", "🎄", "🐳", "🐙", "🐥", "🐷", "🦁", "🐯", "🐏"]
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpLayer()
        makePitcherLayer()
        makeBatterLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpLayer()
        makePitcherLayer()
        makeBatterLayer()
    }
    
    //MARK: - 그라운드 그리기
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
        linePath.lineWidth = 30
        linePath.move(to: CGPoint(x: width / 2, y: height - (height / 5)))
        linePath.addLine(to: CGPoint(x: width - (width / 5), y: height / 2 ))
        linePath.addLine(to: CGPoint(x: width / 2, y: height - (height * 4/5)))
        linePath.addLine(to: CGPoint(x: width - (width * 4/5), y: height / 2))
        linePath.close()
        makeBaseLineLayer(path: linePath.cgPath)
    }
    
    func makeHomeBase(width: CGFloat, height: CGFloat) {
        let homeBasePath = UIBezierPath()
        homeBasePath.move(to: CGPoint(x: width / 2, y: height - (height / 5) - 20))
        homeBasePath.addLine(to: CGPoint(x: width / 2 - 20, y: height - (height / 5)))
        homeBasePath.addLine(to: CGPoint(x: width / 2 - 20, y: height - (height / 5) + 20))
        homeBasePath.addLine(to: CGPoint(x: width / 2 + 20, y: height - (height / 5) + 20))
        homeBasePath.addLine(to: CGPoint(x: width / 2 + 20, y: height - (height / 5)))
        homeBasePath.close()
        
        makeBaseLayer(path: homeBasePath.cgPath)
    }

    func makeFirstBase(width: CGFloat, height: CGFloat) {
        let firstBasePath = UIBezierPath()
        firstBasePath.move(to: CGPoint(x: width - (width / 5) - 15, y: height / 2))
        firstBasePath.addLine(to: CGPoint(x: width - (width / 5), y: (height / 2) - 15))
        firstBasePath.addLine(to: CGPoint(x: width - (width / 5) + 15, y: height / 2))
        firstBasePath.addLine(to: CGPoint(x: width - (width / 5), y: (height / 2) + 15))
        firstBasePath.close()
        
        makeBaseLayer(path: firstBasePath.cgPath)
    }

    func makeSecondBase(width: CGFloat, height: CGFloat) {
        let secondBasePath = UIBezierPath()
        secondBasePath.move(to: CGPoint(x: width / 2, y: height - (height * 4/5) - 15))
        secondBasePath.addLine(to: CGPoint(x: (width / 2) - 15, y: height - (height * 4/5)))
        secondBasePath.addLine(to: CGPoint(x: width / 2, y: height - (height * 4/5) + 15))
        secondBasePath.addLine(to: CGPoint(x: (width / 2) + 15, y: height - (height * 4/5)))
        secondBasePath.close()
        
        makeBaseLayer(path: secondBasePath.cgPath)
    }

    func makeThirdBase(width: CGFloat, height: CGFloat) {
        let thirdBasePath = UIBezierPath()
        thirdBasePath.move(to: CGPoint(x: width - (width * 4/5) + 15, y: height / 2))
        thirdBasePath.addLine(to: CGPoint(x: width - (width * 4/5), y: (height / 2) - 15))
        thirdBasePath.addLine(to: CGPoint(x: width - (width * 4/5) - 15, y: height / 2))
        thirdBasePath.addLine(to: CGPoint(x: width - (width * 4/5), y: (height / 2) + 15))
        thirdBasePath.close()
        
        makeBaseLayer(path: thirdBasePath.cgPath)
    }
    
    func makeBaseLineLayer(path: CGPath) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        layer.addSublayer(shapeLayer)
    }
    
    func makeBaseLayer(path: CGPath) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(shapeLayer)
    }
    
    //MARK: - 선수 만들기
    func makeRunnerLayer(position: CGPoint) {
        let playerLayer = CALayer()
        batterArr.append(playerLayer)
        let playerImage = emojiArray[Int.random(in: 0..<emojiArray.count)].image()?.cgImage
        playerLayer.frame = CGRect(x: returnPoint(at: .home).x, y: returnPoint(at: .home).y, width: 40, height: 40)
        playerLayer.contents = playerImage
        playerLayer.position = position
        layer.addSublayer(playerLayer)
    }
    
    func makeBatterLayer() {
        let batterLayer = CALayer()
        let batterImage = UIImage(named: "batter.png")?.cgImage
        batterLayer.frame = CGRect(x: returnPoint(at: .home).x, y: returnPoint(at: .home).y - 20, width: 50, height: 50)
        batterLayer.contents = batterImage
        layer.addSublayer(batterLayer)
    }
    
    func makePitcherLayer() {
        let pitcherLayer = CALayer()
        let pitcherImage = UIImage(named: "pitcher.png")?.cgImage
        pitcherLayer.frame = CGRect(x: self.frame.width/2 - 20, y: self.frame.height/2 - 50,  width: 50, height: 50)
        pitcherLayer.contents = pitcherImage
        layer.addSublayer(pitcherLayer)
        
    }
    
    enum Point: String {
        case home = "home"
        case first = "first"
        case second = "second"
        case third = "third"
    }
    
    func returnPoint(at Point: Point) -> CGPoint {
        let width = self.frame.width
        let height = self.frame.height
        
        switch Point {
        case .home:
            return CGPoint(x: width/2, y: height - (height / 5))
        case .first:
            return CGPoint(x: width - (width / 5) - 15, y: height / 2)
        case .second:
            return CGPoint(x: width / 2, y: height - (height * 4/5) - 15)
        case .third:
            return CGPoint(x: width - (width * 4/5) + 15, y: height / 2)
        }
    }

    
    //MARK: - 이동 애니메이션
    func firstBaseAnimation(layer: CALayer) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = returnPoint(at: .home)
        animation.toValue = returnPoint(at: .first)
        animation.duration = 1
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    func secondBaseAnimation(layer: CALayer) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = returnPoint(at: .first)
        animation.toValue = returnPoint(at: .second)
        animation.duration = 1
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    func thirdBaseAnimation(layer: CALayer) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = returnPoint(at: .second)
        animation.toValue = returnPoint(at: .third)
        animation.duration = 1
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    func homeBaseAnimation(layer: CALayer) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = returnPoint(at: .third)
        animation.toValue = returnPoint(at: .home)
        animation.duration = 1
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    //MARK: - hit
    func hit() {
        makeRunnerLayer(position: returnPoint(at: .home))

        CATransaction.begin()
        for layer in batterArr {
            switch layer.position {
            case returnPoint(at: Point.first):
                layer.position = self.returnPoint(at: .second)
                layer.add(secondBaseAnimation(layer: layer), forKey: "second")
                
            case returnPoint(at: Point.second):
                layer.position = self.returnPoint(at: .third)
                layer.add(thirdBaseAnimation(layer: layer), forKey: "third")
                
            case returnPoint(at: Point.third):
                layer.position = self.returnPoint(at: .home)
                CATransaction.setCompletionBlock({
                    layer.removeFromSuperlayer()
                })
                layer.add(homeBaseAnimation(layer: layer), forKey: "home")
                
            case returnPoint(at: Point.home):
                layer.position = self.returnPoint(at: .first)
                layer.add(self.firstBaseAnimation(layer: layer), forKey: "first")
                
            default:
                break
            }
        }
        CATransaction.commit()
    }
    
    func setupBallCount(ball: String) {
        print(ball)
        if ball == "STRIKE" && strikeNum < 2{
            strikeCount[strikeNum].backgroundColor = UIColor.systemYellow
            strikeNum += 1
        } else if ball == "BALL" && ballNum < 3{
            ballCount[ballNum].backgroundColor = UIColor.systemGreen
            ballNum += 1
        } else if ball == "OUT" {
            for strike in strikeCount {
                strike.backgroundColor = UIColor.clear
            }
            
            for ball in ballCount {
                ball.backgroundColor = UIColor.clear
            }
            
            strikeNum = 0
            ballNum = 0
            
            if outNum == 2 {
                for strike in strikeCount {
                    strike.backgroundColor = UIColor.clear
                }
                for ball in ballCount {
                    ball.backgroundColor = UIColor.clear
                }
                for out in outCount {
                    out.backgroundColor = UIColor.clear
                }
                batterArr.forEach { layer in
                    layer.removeFromSuperlayer()
                }
                outNum = 0
                // 이닝 업데이트, turn 업데이트 해서 get날려야한다.
            } else {
                outCount[outNum].backgroundColor = UIColor.systemRed
                outNum += 1
            }

        } else {
            for strike in strikeCount {
                strike.backgroundColor = UIColor.clear
            }
            for ball in ballCount {
                ball.backgroundColor = UIColor.clear
            }
            strikeNum = 0
            ballNum = 0

            let imageView = UIImageView(frame: CGRect(x: self.frame.width/2, y: self.frame.height/2, width: 0, height: 0))
            imageView.image = UIImage(named: "hit.jpeg")
            self.addSubview(imageView)
            UIImageView.animate(withDuration: 1, delay: 0, options: .transitionFlipFromLeft, animations: {
                imageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
            }, completion: { finish in
                imageView.removeFromSuperview()
            })
        }
    }
}

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
