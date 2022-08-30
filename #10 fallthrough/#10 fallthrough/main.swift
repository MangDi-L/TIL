//
//  main.swift
//  #10 fallthrough
//
//  Created by Mangdi on 2022/08/30.
//

import Foundation

// #10 fallthrough

/*
 fallthrough는 Control Transfer Statements 제어 전송문 5가지중의 하나이다
 스위치 문 안에서 사용하며 다음 case로 넘아갈수있게 해준다.
 
 예를들어, C언어에서는 switch문을 사용할때 fallthrough를 방지하기 위해 모든 case 끝에 break를 넣어준다.
 즉 C언어의 switch문에 기본적으로 fallthrough가 적용이 되어있다는 뜻이다.
 하지만 swift의 switch문은 fallthrough가 기본적으로 탑재가 안되어있기때문에
 해당하는 case에 도착한다면 해당하는 문장만 실행하고 다음case로 넘어가지 않는다.
 의도적으로 case문 이후 다음 case문에 방문해야한다면 fallthrough키워드를 붙여주면 된다.
 */

let a = 1

switch a {
case 1:
    print("1") // 1
    fallthrough
case 2:
    print("2") // 2
default:
    print("default")
}
