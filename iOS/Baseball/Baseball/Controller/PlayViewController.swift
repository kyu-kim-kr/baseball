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
    @IBOutlet weak var ballCountTableView: UITableView!
    @IBOutlet weak var gameScreenView: GameScreenView!
    @Published private var gameViewModel = GameViewModel(gameId: 1, turn: "defense")
    
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ballCountTableView.register(BallCountCell.nib, forCellReuseIdentifier: BallCountCell.identifier)
        loadGame()
    }
    
    func configure(gameId: Int, turn: String) {
        gameViewModel = GameViewModel(gameId: gameId, turn: turn)
    }
    
    func loadGame() {
        gameViewModel.fetchGame()
            .sink(receiveValue: {[weak self] game in
                self?.ballCountTableView.reloadData()
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
    @IBAction func pitchButtonTouched(_ sender: UIButton) {
//        gameViewModel.configure(gameId: 1, turn: "defense", inning: 2, inningStatus: "TOP")
        gameViewModel.put()
        if gameViewModel.game.ballCount.last?.ball == "HIT" {
            gameScreenView.hit()
        }
        gameScreenView.setupBallCount(ball: gameViewModel.game.ballCount.last?.ball ?? "")
    }
}

// gameID 1 -> 내가 Home 일경우
// game/1/defense/1/TOP
// 3out 이면 계산해서
// game/1/attack/1/BOTTOM
// 3out 이면 계산해서
// game/1/defense/2/TOP

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
