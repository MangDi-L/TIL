//
//  main.swift
//  #23 reduce
//
//  Created by Mangdi on 2022/09/23.
//

import Foundation

// #23 reduce
/*
 map, filter에 이어 이번에 reduce를 공부해봤다.
 */
let numberArray = [1,2,3,4,5]
var sum = 0

for num in numberArray {
    sum += num
}
debugPrint(sum) // 15

var sum2 = numberArray.reduce(0) { $0 + $1 }
debugPrint(sum2) // 15

/*
 이처럼 reduce고차함수를 사용하면 단 한줄로 쉽게 구현이 가능해진다.
 그런데 reduce는 어떤식으로 연산하는걸까 궁금해서 debugPrint문으로 찍어보았다.
 */

var sum3 = numberArray.reduce(0) { result, item  -> Int in
    debugPrint("\(result) + \(item)")
//    "0 + 1"
//    "1 + 2"
//    "3 + 3"
//    "6 + 4"
//    "10 + 5"
    return result + item
}
debugPrint(sum3) // 15

/*
 reduce(0) 이 값이 초기값이며 result는 더한 값의 결과를, item은 다음에 연산할 요소가 들어오는것을 확인할수있다.
 먼가 신기한 구조로 돌아가는것같다.
 */
