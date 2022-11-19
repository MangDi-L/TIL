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
        static let first = "?page_no=1&items_per_page=100"
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    var searchListPages: [SearchListPage] = []
    let group = DispatchGroup()
//    var searchListPages: [SearchListPage] = [] {
//        willSet(newValue) {
//            print(searchListPages)
////            print("새로운값",newValue)
//        }
//
//        didSet(oldValue) {
//            print(searchListPages)
//        }
//    }
    var detailProduct: DetailProduct? = nil
    let networkCommunication: NetworkCommunication = NetworkCommunication()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell")
        getResponseAboutHealChecker()
        DispatchQueue.global().async(group: self.group) {
            self.getDataFromUrl()
        }
        
        print(searchListPages)
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
            url: ApiUrl.host+ApiUrl.Path.products+ApiUrl.Query.first,
            type: SearchListProducts.self) { result in
                switch result {
                case .success(let data):
                    guard let decodingData = data as? SearchListProducts else { return }
                    self.searchListPages = decodingData.pages
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
//                    print(decodingData.pages[2])
                case .failure(_):
                    print("fail")
                }
            }
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
        
//        group.wait()
        DispatchQueue.main.async {
            if indexPath == collectionView.indexPath(for: customCell) {
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
