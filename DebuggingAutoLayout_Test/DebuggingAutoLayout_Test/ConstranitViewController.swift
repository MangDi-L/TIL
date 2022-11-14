//
//  ConstranitViewController.swift
//  DebuggingAutoLayout_Test
//
//  Created by Mangdi on 2022/11/09.
//

import UIKit

class ConstranitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        let safeArea = view.safeAreaLayoutGuide
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.backgroundColor = UIColor.systemGreen
        view.addSubview(button)
        
        let leading = NSLayoutConstraint(item: button,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: safeArea,
                                         attribute: .leading,
                                         multiplier: 1,
                                         constant: 20)
        
        let trailing = NSLayoutConstraint(item: button,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: safeArea,
                                          attribute: .trailing,
                                          multiplier: 1,
                                          constant: -20)
        
        let bottomSafeArea = NSLayoutConstraint(item: button,
                                                attribute: .bottom,
                                                relatedBy: .equal,
                                                toItem: safeArea,
                                                attribute: .bottom,
                                                multiplier: 1,
                                                constant: 0)
        bottomSafeArea.priority = .defaultHigh
        
        let bottomView = NSLayoutConstraint(item: button,
                                            attribute: .bottom,
                                            relatedBy: .lessThanOrEqual,
                                            toItem: view,
                                            attribute: .bottom,
                                            multiplier: 1,
                                            constant: -20)
        
        NSLayoutConstraint.activate([leading, trailing, bottomSafeArea, bottomView])
    }
}
