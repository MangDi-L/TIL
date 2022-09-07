//
//  main.swift
//  #15 타입 고르기 & Copy-On-Write(COW)
//
//  Created by Mangdi on 2022/09/07.
//

import Foundation

// #15 타입 고르기 & Copy-On-Write(COW)

/*
 저번 #13 공부로 값 타입과 참조 타입의 차이를 알았다.
 값 타입은 스택을 사용하고 참조 타입은 힙을 사용한다는것을.
 그렇다면 스택은 어떤 구조일까?
 스택은 한 방향에서만 데이터를 넣고 빼는 구조다.
 스택 포인터를 이용해 빠르게 접근할수있고 할당하는데 많은 시간이 필요로하지않는다.
 반면에 힙은, 할당할때마다 적절한 공간이 있는지 확인하고 할당한다.
 힙은 할당하는 과정이 복잡하기때문에 스택보다 더 많은 오버헤드(시간초과)를 발생시킨다.
 이렇기 때문에 코드를 작성할때 보통 참조타입보다 값타입을 사용하는것이 좋아보인다.
 */

// COW (Copy-On-Write)
/*
 COW는 인스턴스를 복사하고나서 수정이 발생할때 메모리를 할당하는 기법이다.
 아래 코드로 설명하겠다.
 */

var testArray: [Int] = [1,2,3,4,5]
var testArray2 = testArray

debugPrint(UnsafeRawPointer(testArray)) // 0x000000010146c230
debugPrint(UnsafeRawPointer(testArray2)) // 0x000000010146c230

/*
 testArray2에 testArray를 복사했는데 둘다 같은 메모리를 가지고있다.
 */

testArray2[0] = 0
debugPrint(UnsafeRawPointer(testArray)) // 0x000000010146c230
debugPrint(UnsafeRawPointer(testArray2)) // 0x000000010146c7d0

/*
 testArray2의 0번째 값을 바꾸었더니 메모리주소가 다른것을 확인할수있다.
 인스턴스 복사를 하고 아직 수정이 발생하지않으면 참조를 하고
 이후 수정이 발생하게됟다면 메모리를 새로 할당해주는 기능이다.
 swift는 Collection타입에 COW가 구현되어있어서 이런식으로 구현할수있다.
 */
