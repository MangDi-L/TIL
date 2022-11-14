//
//  AnchorViewController.swift
//  DebuggingAutoLayout_Test
//
//  Created by Mangdi on 2022/11/09.
//

import UIKit

class AnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testButton()
        
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func testButton() {
        let button = UIButton()
        let safeArea = view.safeAreaLayoutGuide
    
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.backgroundColor = UIColor.systemGreen
        view.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
                                        constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                         constant: -20).isActive = true
        let safeBottomAnchor = button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        safeBottomAnchor.isActive = true
        safeBottomAnchor.priority = .defaultHigh
        
        button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor,
                                       constant: -20).isActive = true
    }
}
