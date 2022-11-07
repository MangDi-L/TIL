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
let black = DispatchWorkItem {
    for _ in 1...3 {
        print("🖥🖥🖥🖥🖥")
        sleep(1)
    }
}

let semaphore = DispatchSemaphore(value: 1)
let loop = ["망디","메네","벨라"]
var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]

loop.forEach { person in
    DispatchQueue.global().async {
        for _ in 1...3 {
            DispatchQueue.main.sync {
                let card = cards.removeFirst()
                print("\(person): \(card) 카드를 뽑았습니다!")
            }
            sleep(1)
        }
    }
}

//DispatchQueue.global().async {
//    for _ in 1...3 {
//        DispatchQueue.main.sync {
//            let card = cards.removeFirst()
//            print("망디: \(card) 카드를 뽑았습니다!")
//        }
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        DispatchQueue.main.sync {
//            let card = cards.removeFirst()
//            print("멍디: \(card) 카드를 뽑았습니다!")
//        }
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        DispatchQueue.main.sync {
//            let card = cards.removeFirst()
//            print("맹디: \(card) 카드를 뽑았습니다!")
//        }
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...5 {
//        DispatchQueue.main.sync {
//            print("🥶🥶🥶🥶🥶")
//            sleep(1)
//        }
//    }
//}

//let myDispatch = DispatchQueue(label: "Odong", attributes: .initiallyInactive)
//
//myDispatch.async(execute: yellow) // 코드 블록 호출 안됨.
//myDispatch.activate()

//let white = DispatchWorkItem {
//    for _ in 1...3 {
//        print("📃📃📃📃📃")
//        sleep(2)
//    }
//
//    DispatchQueue.global().async(group: group, execute: yellow)
//}
//
//let group = DispatchGroup()
//
//DispatchQueue.global().async(group: group, execute: black)
//DispatchQueue.global().async(group: group, execute: white)
//
//group.wait()
//print("모든 작업이 끝났습니다.")

//let group = DispatchGroup()
//
//DispatchQueue.global().async(group: group, execute: blue)
//DispatchQueue.global().async(group: group, execute: red)
//
//// group.enter()
//// DispatchQueue.global().async(execute: blue)
//// DispatchQueue.global().async(execute: red)
//// group.leave()
//
//group.notify(queue: .global()) {
//    print("모든 작업이 끝났습니다.")
//}

//let group = DispatchGroup()
//
//DispatchQueue.global().async(group: group, execute: blue)
//DispatchQueue.global().async(group: group, execute: red)
//
////group.wait()
////print("모든 작업이 끝났습니다.")
//group.wait(timeout: .now() + 10)
// print("모든 작업이 끝났습니다.")

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

//DispatchQueue.global().asyncAfter(deadline: .now() + 0.7, execute: yellow)
//DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: red)
