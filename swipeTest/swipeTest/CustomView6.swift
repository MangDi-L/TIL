//
//  CustomView6.swift
//  swipeTest
//
//  Created by Mangdi on 2022/11/12.
//

import UIKit

class CustomView6: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("회색 터치")
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
    
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
//                    print("회색 터치")
                    return hitTestView
                }
            }
            return self
        }
        return nil
    }

}
