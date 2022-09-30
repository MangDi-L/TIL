//
//  main.swift
//  #27 NumberFormatter
//
//  Created by Mangdi on 2022/09/30.
//

import Foundation

// #27 NumberFormatter
/*
 계산된 숫자를 원하는형태로 표현할때 NumberFormatter를 이용하면 쉽게 구현이 가능하다.
 3자릿수마다 콤마(,)를 추가하고싶다면 .numberStyle을 .decimal로,
 맨 앞에 값 표시를 해주고싶다면 .currency로 설정해주면된다.
 
 이 밖에도, 숫자에 제한을 둘수도 있다.
 .maximumSignificantDigits로 숫자가 최대로 나타낼수있는 값의 범위를 설정해줄수있고
 .maximumIntegerDigits로 정수형값의 표현자릿수를 정해줄수있다.
 .maximumFractionDigits로 소수점 자릿수로 마찬가지다.
 */

let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .decimal
numberFormatter.maximumSignificantDigits = 3

let doubleArray1: [Double] = [123, 1234, 12345]

for i in doubleArray1 {
    debugPrint(numberFormatter.string(for: i) ?? "")
//     "123"
//     "1,230"
//     "12,300"
}

/*
 numberStyle을 decimal로 주어서 3자릿수마다 콤마를 넣어주고
 표현 자릿수를 3으로 설정했기때문에 나머지 자리는 자동으로 반올림처리된다.
 */
