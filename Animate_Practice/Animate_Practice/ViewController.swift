//
//  ViewController.swift
//  Animate_Practice
//
//  Created by Mangdi on 2022/12/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var firstView: UIView!
    @IBOutlet private weak var secondView: UIView!
    @IBOutlet private weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveView()
//        moveView2()
    }
    // 가속도
    private func moveView() {
        UIView.animate(withDuration: 2, delay: 0, options: .curveLinear) {
            self.firstView.transform = CGAffineTransform(translationX: 300, y: 0)
        } completion: { finished in
            UIView.animate(withDuration: 2, delay: 0, options: .curveLinear) {
                self.secondView.transform = CGAffineTransform(translationX: -100, y: 0)
            } completion: { finished in
                UIView.animate(withDuration: 2, delay: 0, options: .curveLinear) {
                    self.thirdView.transform = CGAffineTransform(translationX: 0, y: 200)
                } completion: { finished in
                    UIView.animate(withDuration: 2, delay: 0, options: .curveLinear) {
                        self.firstView.transform = .identity
                        self.secondView.transform = .identity
                        self.thirdView.transform = .identity
                    } completion: { finished in
                        self.moveView2()
                    }
                }
            }
        }
    }
    
    // 일정하게
    private func moveView2() {
        UIView.animateKeyframes(withDuration: 8, delay: 0, options: []) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2/8) {
                self.firstView.transform = CGAffineTransform(translationX: 300, y: 0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 2/8, relativeDuration: 2/8) {
                self.secondView.transform = CGAffineTransform(translationX: -100, y: 0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 4/8, relativeDuration: 2/8) {
                self.thirdView.transform = CGAffineTransform(translationX: 0, y: 200)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 6/8, relativeDuration: 2/8) {
                self.firstView.transform = .identity
                self.secondView.transform = .identity
                self.thirdView.transform = .identity
            }
        } completion: { finished in
//            print("완료")
        }
    }
}

