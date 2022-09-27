//
//  main.swift
//  #26 Static Dispatch & Dynamic Dispatch
//
//  Created by Mangdi on 2022/09/27.
//

import Foundation

// #26 Static Dispatch & Dynamic Dispatch

/*
 저번 TIL에 타입메서드 (static과 class를 붙인 메서드)의 사용법을 알아보았다.
 이번 TIL에는 이들을 왜 쓰는건지에 대해 알아보는 시간을 갖도록 하겠다.
 
 먼저 컴파일타임과 런타임에 대해 알아두어야 한다.
 개발자가 소스코드를 작성하고 컴파일을 통해 기계어로 변환되어 실행 가능한 프로그램이 되는 이러한 과정을 컴파일타임이라고 부른다.
 이런 컴파일과정을 마친 프로그램이 사용자의 의해 실행 될 때를 런타임이라고 부른다.
 
 Method Dispatch는 메서드를 호출할때 메모리에서 어떻게 각 메서드들을 실행할지 결정하도록 돕는 메커니즘이다.
 
 Static Dispatch는 컴파일타임에 호출할 함수를 결정해서 런타임에 그대로 실행한다.
 컴파일 타임에 준비동작을 마치기때문에 런타임때 수행할 함수의 메모리주소로 바로 점핑한다.
 이는 성능을 크게 향상시키는 이점을 가진다.
 
 Dynamic Dispatch는 런타임에 호출할 함수를 결정한다.
 때문에 클래스마다 함수 포인터들의 배열인 vTable(Virtual Dispatch Table)을 갖는다.
 하위 클래스가 메서드를 호출할 때, 이 vTable을 참조해서 호출할 함수를 결정한다.
 이는 Static Dispatch에 비해 오버헤드가 더 들고 성능이 낮다.
 그럼에도 Dynamic Dispatch를 왜 쓰느냐? 그 이유는 바로 다양성과 유연성때문이다.
 
 Referencse Type, Value Type 같은 swift에서 사용하는 대표적인 타입들이 어떤 Dispatch를 사용하는지 알아보자.
 
 Value Type인 struct나 enum은 상속을 할수없기때문에 Static Dispatch를 사용한다.
 
 Reference Type의 class에는 상속이란 기능이 있다.
 각 클래스마다 vTable을 참조하여 런타임시점에 어떤 메서드가 불려야하는지 확인해서 참조한다.
 모든 클래스가 잠재적으로 오버라이딩할수있기 때문에 오버라이딩을 했든안했든 vTable을 참조해야한다.
 근데 만약 상속을 하지않을건데 계속 Dynamic Dispatch로 동작하면 성능상 손해를 계속 볼수밖에 없다.
 그런데 상속을 하지않거나 필요없는 Class에서 Static Dispatch로 동작하게 할 수 있는 방법이 있다.
 바로 final 키워드를 붙여주는것이다. final 키워드를 붙이면 더이상 상속이 불가능하기때문에
 클래스 내 모든 프로퍼티와 메서드가 Static Dispatch로 동작하게 된다.
 그리고 또 static, class키워드의 차이도 설명할수있다.
 static이 붙은 프로퍼티나 메서드는 상속해서 사용할수없기때문에 Static Dispatch를 사용하고
 class는 상속해서 사용할수 있기때문에 Dynamic Dispatch를 사용한다,
 
 이렇게 이 둘을 사용하는 이유를 설명하기 위해 글을 장황하게 쓴것같다...
 static과class를 사용하는 이유에 대해 알기위해  Static, Dynamic Dispatch에 관해 짤막하게 알아보았다.
 이는 중요한 개념으로 보이니 나중에 따로 깊게 한번 파봐야겠다.
 */
