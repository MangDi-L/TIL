//
//  main.swift
//  #25 인스턴스메서드와 타입메서드
//
//  Created by Mangdi on 2022/09/26.
//

import Foundation

/*
 인스턴스 메서드는 보통 우리가 타입 내에서 함수를 정의할때 쓰는 그런 일반적인 함수를 인스턴스 메서드라고 한다.
 타입 메서드는 func 앞에 static, class 키워드를 붙인 메서드를 의민한다.
 인스턴스 메서드는 인스턴스화 할때 사용할수 있지만 타입 메서드는 타입 그 자체의 메서드라 서로 호출방식도 다르다.
 프로퍼티중에 저장프로퍼티,연산프로퍼티와 저장타입프로퍼티,연산타입프로퍼티의 차이와 거의 동일하다고 보면된다.
 */

class SomeType {
    var name: String = ""
    
    func settingName(name: String) {
        self.name = name
    }
    
    static func sayHello() {
        print("Hello")
    }
    
    class func sayGoodBye() {
        print("GoodBye")
    }
}

var a = SomeType()
a.settingName(name: "mangdi") // 인스턴스메서드 호출
SomeType.sayHello() // 타입메서드 호출
SomeType.sayGoodBye() // 타입메서드 호출

/*
 위의 코드에서 인스턴스메서드와 타입메서드의 호출 방식의 차이를 알수있다.
 타입메서드를 사용하려면 static과 class키워드를 붙여주어야하는것은 알겠다. 그렇다면 저 둘의 차이는 멀까?
 본론부터 말하자면 static은 오버라이딩이 불가하고 class는 가능하다.
 */

class SomeSomeType: SomeType {
    
    override class func sayGoodBye() {
        print("SeeYouAgain")
    }
}

SomeSomeType.sayGoodBye() // SeeYouAgain

/*
 이런식으로 class키워드로 작성된 타입메서드는 오버라이딩으로 새롭게 작성 해줄수있다.
 static과 class의 차이를 알겠다. 근데 이것들은 왜 사용하며 어디에 쓰이는걸까?
 그것에 대한 궁금증은 다음 TIL에서 작성하겠다.
 */
