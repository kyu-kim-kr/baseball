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

    @Published private var gameViewModel = GameViewModel()
    private var subscriptions = Set<AnyCancellable>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BallCountTableView.register(BallCountCell.nib, forCellReuseIdentifier: BallCountCell.identifier)

        loadGame()

    }
    
    func loadGame() {
        gameViewModel.fetchGame()
            .sink(receiveValue: {[weak self] game in
                self?.BallCountTableView.reloadData()
            })
            .store(in: &subscriptions)
        
        gameViewModel.except()
            .sink(receiveValue: {[weak self] error in
                self?.showAlert(error: error)
            })
            .store(in: &subscriptions)
    }
    
    func showAlert(error: String) {
        let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension PlayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BallCountCell.identifier, for: indexPath) as? BallCountCell else {
            return BallCountCell()
        }
        return cell
    }
    
    
}
