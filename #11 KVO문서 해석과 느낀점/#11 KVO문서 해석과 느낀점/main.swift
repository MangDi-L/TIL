//
//  main.swift
//  #11 KVO문서 해석과 느낀점
//
//  Created by Mangdi on 2022/09/01.
//

// #11 KVO문서 해석과 느낀점

// https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/KVO.html
/*
 위 링크의 영어문장들을 해석해서 그걸 바탕으로 느낀점을 정리했다.
 
 
 다른 객체의 프로퍼티가 변경되면 객채가 직접 알림을 받을수 있도록 하는 메커니즘이다.

 애플리케이션의 응집력에 중요한 요소다.

 MVC패턴을 준수하는 애플리케이션에 개체 간의 통신 모드이다.

 예를 들어, Model 객체의 상태를 View와 Controller 층 객체와 동기화하는것에 사용할수있다.

 일반적으로 Controller 객체는 Model객체를 감시하고, View객체는 Controller객체 또는 Model객체를 감시한다.

 View - Controller - Model
          ovserve  ->   *
 ovserv ->    *    ->   *

 KVO를 사용하면 한 객체가 다른 객체의 모든 프로퍼티를 감시할수있다.

 객체는 프로퍼티의 현재와 이전값이 무엇인지 알아낼수있다.

 To - many 관계의 관찰자는 변경된 유형에 대해 정보를 받을뿐만 아니라 변경에 어떤 객체가 관련되어있는지도 알려준다.

 알림 매커니즘으로서 KVO는 NSNotification과 NSNotificationCenter클래스에서 제공하는 메커니즘과 유사하지만 중요한 차이점이 있다.

 옵저버로 등록된 모든 객체로 알림을 브로드캐스팅 하는 중앙 객체 대신에
 KVO알림은 프로퍼티값이 변경되는 즉시 관찰중인 객체로 이동한다.
 
 
 
 해석해보고 느낀점 : NSNotification은 연결된 중앙 객체를 통해 객체로 정보를 전달하지만
 KVO는 그럴 필요 없이 바로 객체로 이동하는듯하다.
 애플리케이션은 결합도는 낮고 응집도는 높게 해야한다.
 NSSNotification은 중앙을 통해 다른객체와 상호작용하기때문에 결합도가 높아보이는것에 비해
 KVO는 그러한 연결점이 없기 때문에 결합도를 낮추고 응집도를 높일수 있는 기법이 되는것같다.

 */
