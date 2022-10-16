//
//  SecondViewController.swift
//  SimpleTable
//
//  Created by Mangdi on 2022/10/16.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textToSet: String?
    
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = textToSet
    }
}
