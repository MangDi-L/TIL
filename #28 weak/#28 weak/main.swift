//
//  main.swift
//  #28 weak
//
//  Created by Mangdi on 2022/10/04.
//

import Foundation

// #28 weak

/*
 20번째 TIL에서 ARC에 대해 알아보았다.
 그럼 이어서 weak는 어떻게 사용해야하는지 설명하겠다.
 
 인스턴스가 해제되면 ARC가 자동으로 참조횟수를 카운트해서 0이 된다면 할당을 해제해주는것은 알겠다.
 그런데 만약 아래같은 상황이 벌어진다고 가정해보자
 */

class A {
    var subB: B? = nil
    deinit { print("A해제") }
}

class B {
    var subA: A? = nil
    deinit { print("B해제") }
}

var a: A? = A() // RC + 1
var b: B? = B() // RC + 1

a?.subB = b // RC + 1
b?.subA = a // RC + 1

b = nil // RC - 1
a = nil // RC - 1

/*
 이 상황은
 변수 a가 A인스턴스를 참조하고
 변수 b가 B인스턴스를 참조한다. 이러면 A와 B 가각 RC가 1 증가하고
 
 a에서 subB변수로 B를 참조하고
 b에서 subA변수로 A를 참고하는 서로 참조하는상황이다.
 이로써 A B 인스턴스 각각 AC가 1 증가하여 총 2개가 되었다.
 
 그리고 b = nil 과 a = nil로 A와 B인스턴스의 참조를 끊었다.
 이부분에서 RC가 각각 1 감소한다.
 
 그런데 deinit이 호출되지 않았다 그 이유는 아직 해제가 안되었기 때문이다
 힙 메모리 안에서 subB와 subA가 각각 인스턴스를 참조하고있기 때문에 AC가 각각 1인 상태다.
 이를 순환참조라고하는데, 이를 해결하기 위해 weak를 사용한다.
 
 weak로 정의해줄경우 RC가 증가하지 않는다.
 아래 코드를 보자
 */

//class A {
//    weak var subB: B? = nil
//    deinit { print("A해제") }
//}
//
//class B {
//    var subA: A? = nil
//    deinit { print("B해제") }
//}
//
//var a: A? = A() // RC + 1
//var b: B? = B() // RC + 1
//
//a?.subB = b
//b?.subA = a // RC + 1
//
//b = nil // RC - 1, B해제 출력
//a = nil // RC - 1, A헤제 출력

/*
 subB를 weak로 선언해주었기때문에 인스턴스를 할당할때 AC가 증가하지않는다.
 때문에 B인스턴스의 RC는 최종적으로 1이며 b = nil 구문에서 AC가 0이 되므로 deinit이 호출된다.
 B가 메모리에서 해제되었기때문에 A의 subB는 nil이 할당되고
 a = nil 구문을 통해 A의 AC가 0이 되므로 deinit이 호출된다.
 최종적으로 weak를 사용하여 순환참조를 해결할수있다.
 
 보통 weak는 수명이 짧은 인스턴스를 대상으로 선언해준다.
 A ,B ,C 클래스가 있다 가정할때
 C -> B -> A 순으로 죽는다면
 가장 먼저 죽는 C를 참조하는 변수에 weak로 선언해주면 된다.
 
 사실 weak 말고도 unowned라는게 하나 더 있다.
 이것에 대해서는 다음 TIL에 작성해보도록하겠다.
 */
