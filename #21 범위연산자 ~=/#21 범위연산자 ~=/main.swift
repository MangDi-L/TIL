//
//  main.swift
//  #21 범위연산자 ~=
//
//  Created by Mangdi on 2022/09/19.
//

import Foundation

// #21 범위연산자 ~=
let input = 10
// input값이 0~10 사이의 값이라면
if 0...10 ~= input {
    print("통과") // 통과
}

/*
 ~=범위연산자를 사용해서 위의 코드와 같이 사용할수있다.
 아래의 코드를 통해 좀더 알아보자
 */

let input2 = [0,1,2,3,4,5,6,7,8,9,10]

for num in input2 where 0..<5 ~= num {
    print(num,terminator: "") // 01234
}

/*
 0..<5는 0에서 5미만까지를 의미한다. 그러므로 0부터 4까지 해당하는 num을 출력하게된다.
 ~=범위 연산자를 처음 봤을때 이걸 어떻게 쓰는지 궁금했었다.
 swift의 왠만한 문법?은 이제 잘 알았다고생각했는데 for in 문에 where을 붙여서 사용할수있다는것도 몰랐었다.
 갈길이 멀다.
 */
