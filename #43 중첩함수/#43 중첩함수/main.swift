//
//  main.swift
//  #43 중첩함수
//
//  Created by Mangdi on 2022/11/02.
//

import Foundation

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
print(chooseStepFunction(backward: true)(1))
print("\n")
// -4...
// -3...
// -2...
// -1...
// zero!

func bigFuntion(isCheck: Bool) -> (Int) -> (Int) -> Int {
    func firstFunction(firstInput: Int) -> (Int) -> Int {
        func secondFunction(secondInput: Int) -> Int {
            return secondInput - 1
        }
        return secondFunction
    }
    return firstFunction
}

let firstData = bigFuntion(isCheck: true)
let secondData = firstData(1)
let thirdData = secondData(10)

print(firstData) // (Function)
print(secondData) // (Function)
print(thirdData) // 9

