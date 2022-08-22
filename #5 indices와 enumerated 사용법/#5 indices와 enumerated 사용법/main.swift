//
//  main.swift
//  #5 indices와 enumerated 사용법
//
//  Created by Mangdi on 2022/08/22.
//

import Foundation

// #5 indices와 enumerated 사용법

// indices 사용법
var arrayNumber: [Int] = [1,2,3,4,5,100]
let a = arrayNumber.contains(100) // 100이라는숫자가 포함되느냐
print(a) // true
print(arrayNumber.indices) // 0..<6
let b = arrayNumber.indices.contains(5) //5번째 index가 존재하느냐
print(b) // true
let c = arrayNumber.indices.contains(6) //6번째 index가 존재하느냐
print(c) // false

print(arrayNumber.indices.startIndex) // 0
print(arrayNumber.indices.endIndex) // 6
print(arrayNumber.startIndex) // 0
print(arrayNumber.endIndex) // 6

// enumerated 사용법
for (n, c) in "Mangdi".enumerated() {
    print("\(n)번째 인덱스의 값 : \(c)")
//    0번째 인덱스의 값 : M
//    1번째 인덱스의 값 : a
//    2번째 인덱스의 값 : n
//    3번째 인덱스의 값 : g
//    4번째 인덱스의 값 : d
//    5번째 인덱스의 값 : i
}
let nameArray: [String] = ["Mangdi","Kyo","애종"]
for (index,name) in nameArray.enumerated() {
    print("\(index)번째 인덱스 값 : \(name)")
//    0번째 인덱스 값 : Mangdi
//    1번째 인덱스 값 : Kyo
//    2번째 인덱스 값 : 애종
}
