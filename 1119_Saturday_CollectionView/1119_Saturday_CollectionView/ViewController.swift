//
//  ViewController.swift
//  1119_Saturday_CollectionView
//
//  Created by Mangdi on 2022/11/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let emojies = ["🔥", "🥰", "🥲", "👍", "👨‍🔬", "🤪", "🐸", "⚾️"]
    let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        flowLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
//        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 0
//        let itemWidthSize = view.bounds.width / 5
        flowLayout.estimatedItemSize = CGSize(width: view.bounds.width, height: 200)
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
        collectionView.isPagingEnabled = true
        collectionView.decelerationRate = .fast
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.label.text = emojies[indexPath.item]
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
