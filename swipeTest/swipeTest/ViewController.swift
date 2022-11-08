//
//  ViewController.swift
//  swipeTest
//
//  Created by Mangdi on 2022/11/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var positionX: UILabel!
    @IBOutlet var positionY: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1번문제
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipeRightGesture(recognizer:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipeLeftGesture(recognizer:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)

        swipeRight.direction = .right
        swipeLeft.direction = .left

        view.gestureRecognizers = [swipeRight, swipeLeft]
        
//        UIPanGestureRecognizer
//        let swipeRight = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handleSwipeRightGesture(recognizer:)))
//        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//        self.view.addGestureRecognizer(swipeRight)
    }
    
    
    
    // 2번문제
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let a = touches.first?.location(in: view) else { return }
        positionX.text = "x: \(a.x)"
        positionY.text = "y: \(a.y)"

//        guard let previousPosition = touches.first?.previousLocation(in: view) else {
//            return
//        }

//        if previousPosition.x < a.x {
//            label.text = "right"
//        } else {
//            label.text = "left"
//        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("캔슬됨")
    }
}

// 1번문제
extension ViewController {
    @objc func handleSwipeRightGesture(recognizer: UISwipeGestureRecognizer) {
        label.text = "오른쪽"
        print("This swipe is right")
    }
    @objc func handleSwipeLeftGesture(recognizer: UISwipeGestureRecognizer) {
        label.text = "왼쪽"
        print("This swipe is left")
    }
}

