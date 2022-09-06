//
//  main.swift
//  #14 CustomStringConvertible 프로토콜
//
//  Created by Mangdi on 2022/09/06.
//

import Foundation

// #14 CustomStringConvertible 프로토콜

/*
 CustomStringConvertible 프로토콜을 이용하면 사용자 지정오류에 대해 description할수았다.
 한번 익혀두면 다음부터 오류처리할때 정말 쉽게 구현이 가능하니까 한번 눈에 익히면 좋을것같다.
 */

enum someError: Error {
    case testErrorOne
    case testErrorTwo
    case testErrorThree
}

extension someError: CustomStringConvertible {
    var description: String {
        switch self {
        case .testErrorOne:
            return "테스트원 호출"
        case .testErrorTwo:
            return "테스트투 호출"
        case .testErrorThree:
            return "테스트쓰리 호출"
        }
    }
}

func testFunction(one: Bool, two: Int, three: String) throws {
    let isTestBool: Bool = one
    let isTestInt: Int = two
    let isTestString: String = three
    
    if !isTestBool {
        throw someError.testErrorOne
    } else if isTestInt < 10 {
        throw someError.testErrorTwo
    } else if isTestString == "5" {
        throw someError.testErrorThree
    }
}

do {
    try testFunction(one: false, two: 9, three: "5") // 테스트원 호출
    try testFunction(one: true, two: 9, three: "5") // 테스트투 호출
    try testFunction(one: true, two: 10, three: "5") // 테스트쓰리 호출
} catch {
    debugPrint(error)
}

// 이런식으로 쉽게 오류처리를 구현할수있다.
