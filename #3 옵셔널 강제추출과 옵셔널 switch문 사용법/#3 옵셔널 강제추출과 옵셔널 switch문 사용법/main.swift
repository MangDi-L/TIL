//
//  main.swift
//  #3 옵셔널 강제추출과 옵셔널 switch문 사용법
//
//  Created by Mangdi on 2022/08/19.
//

import Foundation

//옵셔널 강제추출
//Unconditional Unwrapping (무조건적인 언래핑) 이라고도 불린다.
//옵셔널 안에 값이 있다면 강제추출해서 값을 나타낼수있다.
//그러나 안에 아무것도 없는 nil이라면 런타임에러를 출력한다.
//사용법은 아래와 같다.

let haveValue : Int? = 1
print(haveValue!) // 1

let noHaveValue : Int? = nil
print(noHaveValue!) // runtime error
// 코드스타터때부터 옵셔널 강제추출은 사용하지 말라는 권고를 받았으니 아 그렇구나 하고 넘어가겠습니다.

//옵셔널 Switch문 사용법
//옵셔널로 스위치문을 사용할때 case .none 과 case .some을 입력해줘야한다.
//.none은 nil값일 경우를 나타내고 .some은 nil값이 아니면서 위의 케이스들에 해당하지 않을경우를 나타낸다.

let someValue : Int? = 123

switch someValue {
case 1 :
    print("값은 1입니다")
case .none: // nil값일경우 호출
    print("값이 없습니다.")
case .some(let value): // nil이 아니면서 위에 해당하는case가 없을때 호출
    print(value) // 123
}
