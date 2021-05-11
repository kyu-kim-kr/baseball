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
                self?.showAlert(error: error)
            })
            .store(in: &subscriptions)
            
        
//        gameListViewModel.$gameList
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { (result) in
//                switch result {
//                case .failure(let error):
//                    print(error)
//                case .finished:
//                    break
//                }
//            }, receiveValue: { [unowned self] _ in
//                gameListCollectionView.reloadData()
//            })
//            .store(in: &subscriptions)
    }
    
    func showAlert(error: String) {
        let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
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
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 10
        let height = (collectionView.bounds.height) / 5 - 10
        
        return CGSize(width: width, height: height)
    }
}

