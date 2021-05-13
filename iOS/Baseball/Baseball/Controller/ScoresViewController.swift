//
//  ScoresViewController.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/06.
//

import UIKit
import Combine

class ScoresViewController: UIViewController {
    
    @IBOutlet weak var headerView: GamePlayHeaderView!
    @IBOutlet var awayScoreLabel: [UILabel]!
    @IBOutlet var homeScoreLabel: [UILabel]!
    @IBOutlet weak var playerInformationTableView: UITableView!
    @IBOutlet weak var teamSegmentControl: UISegmentedControl!
    
    @Published private var detailPlayerViewModel = DetailPlayerViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerInformationTableView.register(PlayerInformationCell.nib,
                                                 forCellReuseIdentifier: PlayerInformationCell.identifier)
        loadDetailPlayer()
        teamSegmentControl.addTarget(self, action: #selector(segmentControlChanged), for: .valueChanged)
    }
    
    func loadDetailPlayer() {
        detailPlayerViewModel.fetchDetailPlayer()
            .sink(receiveValue: {[weak self] detailPlayer in
                self?.playerInformationTableView.reloadData()
                self?.headerView.configure2(gameInformaion: detailPlayer.gameInformation.last ?? GameInformation())
            })
            .store(in: &subscriptions)
        
        detailPlayerViewModel.except()
            .sink(receiveValue: {[weak self] error in
                DispatchQueue.main.async {
                    self?.present(Alert.showErrorAlert(error: error), animated: true, completion: nil)
                }
            })
            .store(in: &subscriptions)
    }
    
    @objc func segmentControlChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: // 어웨이/팀명
            detailPlayerViewModel.path = "away"
            detailPlayerViewModel.teamName = "Captain"
//            detailPlayerViewModel.teamName = detailPlayerViewModel.detailPlayer.gameInformation.last?.awayTeam ?? ""
            detailPlayerViewModel.request()
        case 1:
            detailPlayerViewModel.path = "home"
            detailPlayerViewModel.teamName = "Marvel"
//            detailPlayerViewModel.teamName = detailPlayerViewModel.detailPlayer.gameInformation.last?.homeTeam ?? ""
            detailPlayerViewModel.request()
        default:
            break
        }
    }
}

extension ScoresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailPlayerViewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerInformationCell.identifier, for: indexPath) as? PlayerInformationCell else {
            return PlayerInformationCell()
        }
        cell.player = detailPlayerViewModel.getPlayer(indexPath: indexPath)
        return cell
    }
}
