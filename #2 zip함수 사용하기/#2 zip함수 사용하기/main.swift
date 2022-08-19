//
//  main.swift
//  #2 zip함수 사용하기
//
//  Created by Mangdi on 2022/08/19.
//

import Foundation

/*
2022/08/17

왜 사용하는가?
짝프로그래밍을 하던도중 야구게임을 구현하다가 숫자비교부분을 어떤식으로 구현할까 고민하다가
Kyo가 zip함수를 통해 손쉽게 구현하는것을 보았다.
zip함수는 서로다른 배열을 한데묶어서 같이 병렬처리할때 쉽게쉽게 해결할수있는 함수다.

어떻게 사용하는가? */

let cities = ["seoul", "busan", "incheon"]
let numbers = [1,2,3]
let cityNumbers = zip(cities, numbers)

for cityNumber in cityNumbers {
    print("\(cityNumber.0) , \(cityNumber.1)")
    // seoul , 1
    // busan , 2
    // incheon , 3
}

for (city, number) in zip(cities, numbers) {
    print("\(city) , \(number)")
    // seoul , 1
    // busan , 2
    // incheon , 3
}

//zip으로 묶어줄때 2개만 묶어줄수있다
//그 외에도 cityNumbers.0 로 서로순서가같은 값중에 맨첫번째값을 호출할수있고
//cityNumbers.1로 그 다음값을 호출해줄수있다.
//for문마다 각기 다른방법으로 쓸수있다는것을 표현했다!
