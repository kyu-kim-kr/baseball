//
//  PlayViewController.swift
//  Baseball
//
//  Created by sonjuhyeong on 2021/05/07.
//

import UIKit
import Combine

class PlayViewController: UIViewController {
    
    @IBOutlet weak var playerInfoView: PlayerInfoView!
    @IBOutlet weak var headerView: GamePlayHeaderView!
    @IBOutlet weak var BallCountTableView: UITableView!
    @Published private var gameViewModel: GameViewModel!

    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BallCountTableView.register(BallCountCell.nib, forCellReuseIdentifier: BallCountCell.identifier)
        loadGame()
    }
    
    func configure(gameId: Int, turn: String) {
        gameViewModel = GameViewModel(gameId: gameId, turn: turn)
    }
    
    func loadGame() {
        gameViewModel.fetchGame()
            .sink(receiveValue: {[weak self] game in
                self?.BallCountTableView.reloadData()
                self?.headerView.configure(game: game ?? Game())
                self?.playerInfoView.information = game
            })
            .store(in: &subscriptions)
        
        gameViewModel.except()
            .sink(receiveValue: {[weak self] error in
                DispatchQueue.main.async {
                    self?.present(Alert.showErrorAlert(error: error), animated: true, completion: nil)
                }
            })
            .store(in: &subscriptions)
    }
}

extension PlayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameViewModel.ballCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BallCountCell.identifier, for: indexPath) as? BallCountCell else {
            return BallCountCell()
        }
        
        cell.ballCount = gameViewModel.game.ballCount[indexPath.row]
        cell.configureBallCount(ballCount: gameViewModel.calculateBallCount())
        return cell
    }
}
