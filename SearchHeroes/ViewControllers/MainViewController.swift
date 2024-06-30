//
//  ViewController.swift
//  SearchHeroes
//
//  Created by Лидия Пятаева on 20.06.2024.
//

import UIKit
import Foundation


final class MainViewController: UICollectionViewController {

    private var superHero: [Superhero] = []
    private let networkManager = NetworkManager.shared
   
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSuperHeroes()
    }
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        superHero.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath)
        guard let cell = cell as? MovieCollectionViewCell else {
             return cell
         }
        cell.genreLabel.text = superHero[indexPath.item].name
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}

extension MainViewController {
    
    private func fetchSuperHeroes() {
        guard let url = URL(string:"https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.2.0/api/all.json") ?? nil else { return }
        networkManager.fetch([Superhero].self, from: url) { [weak self] result in
            switch result {
            case .success(let heroes):
                print(heroes)
                self?.superHero = heroes
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
//                self?.showAlert(withStatus: .failed)
            }
        }
    }
}
//switch result {
//case .success(let courses):
//    self?.courses = courses
//    self?.tableView.reloadData()
//case .failure(let error):
//    print(error)
//}


