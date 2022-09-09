//
//  main.swift
//  #16 forEach문
//
//  Created by Mangdi on 2022/09/09.
//

import Foundation

// #16 forEach문

let array = [1,2,3,4,5]

array.forEach { number in
    print("\(number)",terminator: "") // 12345
}

print("")
let dictionary: [String: Int] = ["one": 1, "two": 2, "three": 3]

dictionary.forEach { key, number in
    if number == 2 {
        return
    }
    print("key: \(key), number: \(number)")
}
//key: one, number: 1
//key: three, number: 3

/*
 forEach문은 break, continue 구문을 사용할수 없고
 return을 사용할수있지만 구문 자체를 빠져나오지않고
 return을 사용한 해당 호출만 건너뛰고 다음 후속호출들은 이어진다
 */
