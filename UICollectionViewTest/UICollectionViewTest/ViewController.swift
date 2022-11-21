//
//  ViewController.swift
//  UICollectionViewTest
//
//  Created by Mangdi on 2022/11/14.
//

import UIKit

enum ApiUrl {
    static let host = "https://openmarket.yagom-academy.kr"
    
    enum Path {
        static let healthChecker = "/healthChecker"
        static let products = "/api/products"
        static let detailProduct = "/api/products/32"
    }
    
    enum Query {
        static let first = "?page_no=2&items_per_page="
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let networkCommunication: NetworkCommunication = NetworkCommunication()
    let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let group = DispatchGroup()
    var detailProduct: DetailProduct? = nil
    var searchListPages: [SearchListPage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingSegmentedControll()
        collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell")
        getResponseAboutHealChecker()
        DispatchQueue.global().async(group: self.group) {
            self.getDataFromUrl()
        }
        
        flowLayout.sectionInset = UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
        flowLayout.minimumInteritemSpacing = CGFloat(8)
        let itemWidth = view.bounds.width/100*45
        let itemHeight = itemWidth * 1.5
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        flowLayout.minimumInteritemSpacing = CGFloat(0)
        collectionView.collectionViewLayout = flowLayout
    }
    
    private func getResponseAboutHealChecker() {
        networkCommunication.requestHealthChecker(url: ApiUrl.host+ApiUrl.Path.healthChecker) { response in
            switch response {
            case .success(let response):
                print("healthChecker 동작여부 =",response.statusCode)
            case .failure(_):
                print("fail")
            }
        }
    }
    
    private func getDataFromUrl() {
        networkCommunication.requestProductsInformation(
            url: ApiUrl.host+ApiUrl.Path.products+ApiUrl.Query.first+"100",
            type: SearchListProducts.self) { result in
                switch result {
                case .success(let data):
                    guard let decodingData = data as? SearchListProducts else { return }
                    self.searchListPages = decodingData.pages
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                case .failure(let error):
                    print("실패",error.localizedDescription)
                }
            }
    }
    
    private func settingSegmentedControll() {
        segmentedControl.setWidth(view.bounds.width/4, forSegmentAt: 0)
        segmentedControl.setWidth(view.bounds.width/4, forSegmentAt: 1)
        segmentedControl.layer.borderColor = UIColor.systemBlue.cgColor
        segmentedControl.layer.borderWidth = CGFloat(2)
        segmentedControl.selectedSegmentTintColor = UIColor.systemBlue
        segmentedControl.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: UIControl.State.normal)
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.searchListPages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
        customCell.layer.cornerRadius = CGFloat(10)
        customCell.layer.borderWidth = CGFloat(3)
        customCell.layer.borderColor = UIColor.systemGray3.cgColor
        group.notify(queue: .main) {
            if self.searchListPages != [] && indexPath == collectionView.indexPath(for: customCell) {
                customCell.configureCell(imageSource: self.searchListPages[indexPath.item].thumbnail,
                                         name: self.searchListPages[indexPath.item].name,
                                         price: Int(self.searchListPages[indexPath.item].price),
                                         discountedPrice: Int(self.searchListPages[indexPath.item].discountedPrice),
                                         stock: self.searchListPages[indexPath.item].stock)
            }
            
        }
        return customCell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}
