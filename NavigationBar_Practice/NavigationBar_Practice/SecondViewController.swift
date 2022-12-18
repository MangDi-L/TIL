//
//  SecondViewController.swift
//  NavigationBar_Practice
//
//  Created by Mangdi on 2022/12/18.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.topItem?.title = "bbbbb"
        navigationItem.title = "bbbb"
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                            style: .plain,
                                            target: self,
                                            action: nil)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
//        navigationController?.navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.rightBarButtonItem = barButtonItem
    }
}
