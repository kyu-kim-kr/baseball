//
//  PlayViewController.swift
//  Baseball
//
//  Created by sonjuhyeong on 2021/05/07.
//

import UIKit
import Combine

class PlayViewController: UIViewController {
    
    @IBOutlet weak var BallCountTableView: UITableView!
//    private var headerView = GamePlayHeaderView
    @Published private var gameViewModel = GameViewModel()
    private var subscriptions = Set<AnyCancellable>()
    var path: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BallCountTableView.register(BallCountCell.nib, forCellReuseIdentifier: BallCountCell.identifier)
        loadGame()
        
    }
    
    func loadGame() {
        gameViewModel.fetchGame()
            .sink(receiveValue: {[weak self] game in
                self?.BallCountTableView.reloadData()
//
                GamePlayHeaderView.configure(away: self?.gameViewModel.game.away,
                                           home: self?.gameViewModel.game.home,
                                           awayScore: self?.gameViewModel.game.awayScore,
                                           homeScore: self?.gameViewModel.game.homeScore)
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
        self.headerView.configure(away: self?.gameViewModel.game.away,
                                   home: self?.gameViewModel.game.home,
                                   awayScore: self?.gameViewModel.game.awayScore,
                                   homeScore: self?.gameViewModel.game.homeScore)
        cell.ballCount = gameViewModel.game.ballCount[indexPath.row]
        cell.configureBallCount(ballCount: gameViewModel.calculateBallCount())
        return cell
    }
    
//    func test() {
////        guard let index = gameViewModel.game.players.firstIndex(where: { player in
////            player.batting == false
////        }) else {
////            return
////        }
////
////        gameViewModel.game.players[index].
//        for i in 0..<gameViewModel.game.players.count {
//            if gameViewModel.game.players[i].batting == false {
//                // 타자정보에 넣어준다.
//                break
//            }
//        }
//    }
}
