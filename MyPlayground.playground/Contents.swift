import UIKit
import Foundation

let red = DispatchWorkItem {
    for _ in 1...5 {
        print("🥵🥵🥵🥵🥵")
        sleep(1)
    }
}

let yellow = DispatchWorkItem {
    for _ in 1...5 {
        print("😀😀😀😀😀")
        sleep(1)
    }
}

let blue = DispatchWorkItem {
    for _ in 1...5 {
        print("🥶🥶🥶🥶🥶")
        sleep(1)
    }
}
// 1
//DispatchQueue.global().async(execute: yellow)
//DispatchQueue.global().sync(execute: blue)
//DispatchQueue.main.async(execute: red)
// 2
//DispatchQueue.global().sync(execute: yellow)
//DispatchQueue.global().async(execute: blue)
//DispatchQueue.main.async(execute: red)
// 3
//DispatchQueue.main.async(execute: yellow)
//DispatchQueue.global().async(execute: blue)
//DispatchQueue.global().sync(execute: red)
// 4
//DispatchQueue.main.async(execute: yellow)
//DispatchQueue.global().sync(execute: blue)
//DispatchQueue.global().asyncAndWait(execute: red)

DispatchQueue.global().asyncAfter(deadline: .now() + 0.7, execute: yellow)
DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: red)