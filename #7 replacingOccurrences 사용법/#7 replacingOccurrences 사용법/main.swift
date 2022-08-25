//
//  main.swift
//  #7 replacingOccurrences 사용법
//
//  Created by Mangdi on 2022/08/25.
//

import Foundation

// #7 replacingOccurrences 사용법

let hello = "hi!, im korean nice to meet you"
let renewalHello = hello.replacingOccurrences(of: " ", with: "")
print(renewalHello) // hi!,imkoreannicetomeetyou

func test() {
    guard let input = readLine() else { // "   3   " 입력
        return
    }
    let filterInput = input.replacingOccurrences(of: " ", with: "")
    print(filterInput) // "3"
}
test()
