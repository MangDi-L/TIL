//
//  SecondViewController.swift
//  Animate_Practice
//
//  Created by Mangdi on 2022/12/19.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet private weak var spiderImage: UIImageView!
    @IBOutlet private weak var spiderStripe: UIView!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var door1: UIView!
    @IBOutlet private weak var door2: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        spiderImage.alpha = 0
        spiderStripe.alpha = 0
//        spiderStripe.
    }
    
    @IBAction private func touchUpButton(_ sender: UIButton) {
        moveView()
    }
    
    private func moveView() {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [.autoreverse]) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2) {
                self.door1.transform = CGAffineTransform(translationX: -self.door1.frame.width, y: 0)
                self.door2.transform = CGAffineTransform(translationX: self.door2.frame.width, y: 0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2) {
                self.spiderImage.alpha = 1
                self.spiderStripe.alpha = 1
                self.spiderStripe.bounds = CGRect(x: 0, y: 0, width: 1, height: self.spiderImage.frame.height)
                self.spiderImage.transform = CGAffineTransform(translationX: 0, y: self.spiderImage.frame.height)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 2/2, relativeDuration: 0) {
                self.door1.transform = .identity
                self.door2.transform = .identity
                self.spiderImage.transform = .identity
                self.spiderStripe.transform = .identity
                self.spiderImage.alpha = 0
                self.spiderStripe.alpha = 0
            }
        } completion: { finished in
            print("완료")
        }
    }
}
