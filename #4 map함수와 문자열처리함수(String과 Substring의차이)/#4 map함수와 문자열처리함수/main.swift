//
//  main.swift
//  #4
//
//  Created by Mangdi on 2022/08/19.
//

import Foundation

// #4 map함수와 문자열처리함수

let numbers: [Int] = [1,2,3,4,5]
let plusNumbers: [Int] = numbers.map{$0+1}
print(plusNumbers) // [2, 3, 4, 5, 6]

let pairNumbers: [(Int,Int)] = [(1,2),(3,4),(5,6)]
let plusPairNumbers: [(Int,Int)] = pairNumbers.map{ ($0+1,$1+1) }
print(plusPairNumbers) // [(2, 3), (4, 5), (6, 7)]



let hello = "hi i'm mangdi nice to meet you"
let splitHello = hello.split(separator: " ")
print(splitHello)
// ["hi", "i\'m", "mangdi", "nice", "to", "meet", "you"]
let componentsHello = hello.components(separatedBy: " ")
print(componentsHello)
// ["hi", "i\'m", "mangdi", "nice", "to", "meet", "you"]

print(type(of: splitHello)) // Array<Substring>
print(type(of: componentsHello)) // Array<String>
// 두 변수의 타입이 다르다는것을 알수있다.
// Substring 과 String의 차이를 잘 모르겠다.
// 구글링을 해보니 둘다 StringProtocol을 따르기때문에
// 둘다 거의 동일한 방식으로 사용할수있다고 한다. 추가로
// String은 고유의 저장공간을 갖지만
// Substring은 기존의 String의 고유한 저장공간을 재사용한다고한다.
// 때문에 Substring은 장기간보관에는 적합하지 않다고한다.
// 서로 합칠수있는지 실험해보겠다.

let combineHello = splitHello[0]+componentsHello[1]
print(combineHello) // hii'm
print(type(of: combineHello)) // Substring
// 오오 Substring 과 String을 합치면 Substring타입이 된다.

let combineHello2 = componentsHello[0] + splitHello[1]
print(combineHello2) // hii'm
print(type(of: combineHello2)) // String
// 위와 반대로 String + Substring = String 이라는 결과가 나왔다.
// 맨 앞에 무엇을 먼저 쓰느냐에따라 타입이 다르게출력된다.


