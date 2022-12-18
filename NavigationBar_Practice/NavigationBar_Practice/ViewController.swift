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
        
        navigationController?.navigationBar.topItem?.title = "aaaaa"
//        navigationItem.title = "aaaa"
    }
    
    @IBAction private func touchUpButton(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") else {
            return
        }
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

