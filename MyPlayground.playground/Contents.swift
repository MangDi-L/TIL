import UIKit
import Foundation

let red = DispatchWorkItem {
    for _ in 1...5 {
        print("๐ฅต๐ฅต๐ฅต๐ฅต๐ฅต")
        sleep(1)
    }
}

let yellow = DispatchWorkItem {
    for _ in 1...5 {
        print("๐๐๐๐๐")
        sleep(1)
    }
}

let blue = DispatchWorkItem {
    for _ in 1...5 {
        print("๐ฅถ๐ฅถ๐ฅถ๐ฅถ๐ฅถ")
        sleep(1)
    }
}
let black = DispatchWorkItem {
    for _ in 1...3 {
        print("๐ฅ๐ฅ๐ฅ๐ฅ๐ฅ")
        sleep(1)
    }
}

let semaphore = DispatchSemaphore(value: 1)
let loop = ["๋ง๋","๋ฉ๋ค","๋ฒจ๋ผ"]
var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]

loop.forEach { person in
    DispatchQueue.global().async {
        for _ in 1...3 {
            DispatchQueue.main.sync {
                let card = cards.removeFirst()
                print("\(person): \(card) ์นด๋๋ฅผ ๋ฝ์์ต๋๋ค!")
            }
            sleep(1)
        }
    }
}

//DispatchQueue.global().async {
//    for _ in 1...3 {
//        DispatchQueue.main.sync {
//            let card = cards.removeFirst()
//            print("๋ง๋: \(card) ์นด๋๋ฅผ ๋ฝ์์ต๋๋ค!")
//        }
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        DispatchQueue.main.sync {
//            let card = cards.removeFirst()
//            print("๋ฉ๋: \(card) ์นด๋๋ฅผ ๋ฝ์์ต๋๋ค!")
//        }
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        DispatchQueue.main.sync {
//            let card = cards.removeFirst()
//            print("๋งน๋: \(card) ์นด๋๋ฅผ ๋ฝ์์ต๋๋ค!")
//        }
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...5 {
//        DispatchQueue.main.sync {
//            print("๐ฅถ๐ฅถ๐ฅถ๐ฅถ๐ฅถ")
//            sleep(1)
//        }
//    }
//}

//let myDispatch = DispatchQueue(label: "Odong", attributes: .initiallyInactive)
//
//myDispatch.async(execute: yellow) // ์ฝ๋ ๋ธ๋ก ํธ์ถ ์๋จ.
//myDispatch.activate()

//let white = DispatchWorkItem {
//    for _ in 1...3 {
//        print("๐๐๐๐๐")
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
//print("๋ชจ๋? ์์์ด ๋๋ฌ์ต๋๋ค.")

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
//    print("๋ชจ๋? ์์์ด ๋๋ฌ์ต๋๋ค.")
//}

//let group = DispatchGroup()
//
//DispatchQueue.global().async(group: group, execute: blue)
//DispatchQueue.global().async(group: group, execute: red)
//
////group.wait()
////print("๋ชจ๋? ์์์ด ๋๋ฌ์ต๋๋ค.")
//group.wait(timeout: .now() + 10)
// print("๋ชจ๋? ์์์ด ๋๋ฌ์ต๋๋ค.")

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
