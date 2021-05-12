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
    
    @IBAction func awayButtonTouched(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameTabBarController")
        // path로 attack이 날아가도록 해야한다.
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func homeButtomTouched(_ sender: UIButton) {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameTabBarController")
        // path로 defense가 날아가도록 해야한다.
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}
