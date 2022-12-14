//
//  CustomView2.swift
//  swipeTest
//
//  Created by Mangdi on 2022/11/12.
//

import UIKit

class CustomView2: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("μ£Όν© ν°μΉ")
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }

        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print("π₯°")
                    return hitTestView
                }
            }
            print("π‘")
            if let color = superview?.backgroundColor?.accessibilityName {
                print(color)
                if color == "green" {
                    superview?.backgroundColor = .black
                    print("μ μ ν")
                } else if color == "black" {
                    superview?.backgroundColor = .systemGreen
                    print("μ μ ν")
                }
            }
            return self
        }
        print("π")
        return nil
//        let hitView: UIView? = super.hitTest(point, with: event)
//        if self == hitView {
//            print("π")
//            self.superview?.backgroundColor = .black
//            return nil
//        }
//        print("π‘")
//        return hitView
    }

}

