//
//  ViewController.swift
//  TestTableView
//
//  Created by Mangdi on 2022/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let cellIdentifier: String = "customCell"
    private var menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000)
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000)
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "스윙스(돈까스)", price: 5000)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let foodType = FoodType(rawValue: section),
              let foodCount = menu[foodType]?.count else {
            return 0
        }

        return foodCount
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let foodType = FoodType(rawValue: section) else { return nil }
        return foodType.sectionName
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let foodType = FoodType(rawValue: section) else { return nil }
        return foodType.sectionName
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell: CustomTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as! CustomTableViewCell
        
        if let foodType = FoodType(rawValue: indexPath.section),
           let foods = menu[foodType] {
            customCell.customImageView.image = UIImage(systemName: "lasso")
            customCell.customLabel1.text = foods[indexPath.row].name
            customCell.customLabel2.text = String(foods[indexPath.row].price)
        }
        
        return customCell
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

