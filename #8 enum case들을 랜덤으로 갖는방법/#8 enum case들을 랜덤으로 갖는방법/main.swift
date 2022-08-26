//
//  main.swift
//  #8 enum case들을 랜덤으로 갖는방법
//
//  Created by Mangdi on 2022/08/26.
//

import Foundation

// #8 enum case들을 랜덤으로 갖는방법
/*
 CaseIterable 프로토콜을 따르는 타입들은 일반적으로 연관된 값이 없는 열거형이다.
 CaseIterable 타입을 사용하는경우 타입의 allCases 프로퍼티를 사용하여 모든 타입의 case에 접근할수있다.
 */

enum Numbers: Int, CaseIterable{
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
}

func test() {
    guard let firstRandomNumber = Numbers.allCases.randomElement(),
          let secondRandomNumber = Numbers.allCases.randomElement()?.rawValue else {
        return
    }
    
    print(firstRandomNumber) // [one ~ five] 중 하나
    print(secondRandomNumber) // [1~5] 중 하나
    print(Numbers.allCases.count) // 5
}

test()
