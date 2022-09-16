//
//  main.swift
//  #20 ARC
//
//  Created by Mangdi on 2022/09/16.
//

import Foundation

// #20 ARC
/*
 간혹 코드를 보면 weak를 볼수있다. weak로 선언된 프로퍼티는 nil값을 넣어줄수있다고 대충 알고있었지만
 언제 사용해야하는지 왜 사용해야하는지 이유는 잘 모른다. 이것에 대해 알기위해 삽질을 시작했는데
 먼저 알고 가야할 개념들이 있었다. 그중 ARC에 대해 먼저 알아보자.

 ARC(Automatic Reference Counting)
 ARC는 힙메모리 영역에 할당된 인스턴스가 더이상 사용(참조)되지 않으면 메모리를 해제해주는 역할을한다.
 ARC는 이름대로 참조를 카운팅해서 해당 인스턴스를 참조하는곳이 아무도 없어서 참조카운팅이 0이 된다면 그때 메모리에서 제거하는것이다.
 아래 코드를 보자
 */

class Human {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        debugPrint("안녕")
    }
    deinit { debugPrint("human 메모리해재")}
}

var mangdi: Human? = Human(name: "mangdi", age: 5) // "안녕"
mangdi = nil // "human 메모리해재"

/*
 Human클래스를 만들고 변수 mangdi가 참조를 했다. 그럼 힙 메모리에 저장된 Human인스턴스의 RC가 1 증가한다.
 그런데 mangdi에 nil을 넣어서 참조를 끊었더니 deinit이 되어서 Human의 RC는 0이 된다.
 그 순간에 ARC는 '어, 너 RC가 0개네? 목숨 가져간다~' 하면서 힙 메모리에 저장된 Human인스턴스의 목숨을 가져간다.
 추가로 아래의 코드를 보자
 */

mangdi = Human(name: "mangdi", age: 5) // "안녕"
var mangdi2 = mangdi

/*
 nil값을줬던 mangdi에 다시 인스턴스를 달아줬더니 다시 Human이 힙에 적재되고 RC가 1 증가했다.
 그리고 mangdi2호기에 참조를 달아서 RC가 또 1 증가해 총 2가 된것을 알수있다.
 */
