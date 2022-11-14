//
//  CustomView2.swift
//  swipeTest
//
//  Created by Mangdi on 2022/11/12.
//

import UIKit

class CustomView2: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("주황 터치")
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }

        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print("🥰")
                    return hitTestView
                }
            }
            print("😡")
            if let color = superview?.backgroundColor?.accessibilityName {
                print(color)
                if color == "green" {
                    superview?.backgroundColor = .black
                    print("색 전환")
                } else if color == "black" {
                    superview?.backgroundColor = .systemGreen
                    print("색 전환")
                }
            }
            return self
        }
        print("😎")
        return nil
//        let hitView: UIView? = super.hitTest(point, with: event)
//        if self == hitView {
//            print("😎")
//            self.superview?.backgroundColor = .black
//            return nil
//        }
//        print("😡")
//        return hitView
    }

}

