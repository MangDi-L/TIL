//
//  main.swift
//  #22 filter
//
//  Created by Mangdi on 2022/09/20.
//

import Foundation

// #22 filter
/*
 고차함수 fliter는 조건을 만족하는 요소를 순서대로넣은 배열을 반환한다.
 보통 데이터를 추출할때 사용한다.
 바로 아래의 코드를 보자
 */
let numbers: [Int] = [50, 60, 80, 150, 200, 30, 10, 20, 300]
let newNumbers = numbers.filter { $0 <= 100 }
debugPrint(newNumbers) // [50, 60, 80, 30, 10, 20]

/*
 numbers 배열의 값들을 $0 에 순서대로 들어오고 각각의 값들을 100이랑 비교해서
 같거나 더 작은값을 newNumbers 배열에 순서대로 넣어주는 코드다.
 복잡도는 O(n)이라고 한다. 배열안의 요소가 n개 늘어날수록 n개만큼 복잡도가 증가한다.
 */
