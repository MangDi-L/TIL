//
//  ViewController.swift
//  NavigationBar_Practice
//
//  Created by Mangdi on 2022/12/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.topItem?.title = "aaaaa"
        navigationItem.title = "aaaa"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "car"), primaryAction: nil, menu: nil)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: nil, action: nil)
    }
    
    @IBAction private func touchUpButton(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") else {
            return
        }
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

