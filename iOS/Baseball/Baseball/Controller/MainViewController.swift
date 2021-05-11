//
//  ViewController.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/04.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    @IBOutlet weak var gameListCollectionView: UICollectionView!
    private var gameListViewModel = GameListViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameListCollectionView.register(GameListCell.nib, forCellWithReuseIdentifier: GameListCell.identifier)
        loadGameList()
    }
    
    func loadGameList() {
        gameListViewModel.fetchGameList()
            .sink(receiveValue: { [weak self] (gameList) in
                self?.gameListCollectionView.reloadData()
            })
            .store(in: &subscriptions)
        
        gameListViewModel.except()
            .sink(receiveValue: {[weak self] (error) in
                DispatchQueue.main.async {
                    self?.present(Alert.showErrorAlert(error: error), animated: true, completion: nil)
                }
            })
            .store(in: &subscriptions)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameListViewModel.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameListCell.identifier, for: indexPath) as? GameListCell else {
            return GameListCell()
        }
        
        cell.gameList = gameListViewModel.getGameList(indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard let viewController = storyboard?.instantiateViewController(identifier: "SelectedGameViewController") as? SelectedGameViewController else {
            return
        }
        
        viewController.game = gameListViewModel.getGameList(indexPath: indexPath)
        viewController.modalPresentationStyle = .formSheet
        self.present(viewController, animated: true, completion: nil)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 10
        let height = (collectionView.bounds.height) / 5 - 10
        
        return CGSize(width: width, height: height)
    }
}

extension MainViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

