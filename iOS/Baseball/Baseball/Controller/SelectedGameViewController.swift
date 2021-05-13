//
//  SelectedGameViewController.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/11.
//

import UIKit

class SelectedGameViewController: UIViewController {

    @IBOutlet weak var awayButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var popOverView: UIView!
    var game: GameList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        awayButton.setTitle(game?.awayTeam, for: .normal)
        homeButton.setTitle(game?.homeTeam, for: .normal)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let viewController = segue.destination as? GameTabBarController else {
//            return
//        }
//        viewController.configure(gameId: game!.gameNo, turn: "TOP")
//    }
    
    @IBAction func awayButtonTouched(_ sender: UIButton) {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameTabBarController")
        // path로 attack, gameId이 날아가도록 해야한다.
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: {
            guard let vc = viewController as? GameTabBarController else {
                return
            }
            vc.configure(gameId: self.game?.gameNo ?? 1, turn: "attack")
        })
    }
    
    @IBAction func homeButtomTouched(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameTabBarController")
        // path로 defense, gameId가 날아가도록 해야한다.
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: {
            guard let vc = viewController as? GameTabBarController else {
                return
            }
            vc.configure(gameId: self.game?.gameNo ?? 1, turn: "defense")
        })
    }
}
