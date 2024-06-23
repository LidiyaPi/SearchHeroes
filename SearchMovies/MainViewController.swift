//
//  ViewController.swift
//  SearchMovies
//
//  Created by Лидия Пятаева on 20.06.2024.
//

import UIKit
import Foundation


class MainViewController: UICollectionViewController {
    
 
    
   
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
 
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath)
        guard let cell = cell as? MovieCollectionViewCell else { return UICollectionViewCell()}
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


