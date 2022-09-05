//
//  main.swift
//  #13 singleton
//
//  Created by Mangdi on 2022/09/05.
//

import Foundation

// #13 싱글톤

/*
 싱글톤은 타입에 하나의 인스턴스만 갖는 기법이다.
 메모리에 항상 상주해있으며
 장소에 상관없이 전역에서 사용가능하다.
 사용방법은 이와 같다.
 */
//class Earth {
//    static let shared: Earth = Earth(color: "Red")
//    var color: String
//
//    private init(color: String) {
//        self.color = color
//    }
//}
//
//debugPrint(Earth.shared.color) // Red
//
//Earth.shared.color = "Green"
//debugPrint(Earth.shared.color) // Green
//
//let testEarth = Earth.shared
//testEarth.color = "Bule"
//debugPrint(Earth.shared.color) // Blue

/*
 싱글톤은 struct타입으로 구현할수있지만 보통 class로 작성한다.
 그 이유는 참조와 값복사 특성의 차이인데
 struct는 단순히 값을 복사하여 새로운 주소에 할당하고
 class는 원본값을 연결하는 주소값을 할당한다.
 
 여기서 struct는 스택메모리를 쓰는 반면 class는 힙과 스택을 같이 쓴다.
 struct는 같은값을갖게 복사를 하는데
 class는 원본값을 힙에 저장하고 원본값을 참조하는 주솟값을 스택에 저장해둔다.
 이것의 차이는 아래 예시를 보며 설명하겠다.
 아래는 struct타입으로 작성하는 예시다.
 */

//struct Earth {
//    static let shared: Earth = Earth(color: "Red")
//    var color: String
//
//    private init(color: String) {
//        self.color = color
//    }
//}
//
//debugPrint(Earth.shared.color) // Red
//
//Earth.shared.color = "Green" // Error: Cannot assign to property: 'shared' is a 'let' constant

// struct로 작성된 shared는 class랑은 다르게 원본값의 주솟값을 갖는것이 아닌 값 자체를 복사하여 갖기때문에
// let 상수로 인해 값을 변경하지 못한다는 오류가 뜨게된다.
// class였다면 원본값으로 연결되는 주솟값을 통해 color를 변경할수있게 된다.
//
// 즉 정리하자면 struct에서의 shared는 color값을 갖고
// class에서의 shared는 color의 원본값을 참조하는 주솟값을 갖게 되는것이다.
