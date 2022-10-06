//
//  main.swift
//  #30 IOS App's Life Cycle
//
//  Created by Mangdi on 2022/10/06.
//

import Foundation

// #30 IOS App's Life Cycle

/*
 [13버전 이전]
 
 하나의 앱에 하나의 window
 
 ApplicationDelegate
 - window기반 앱의 수명 주기 이벤트에 응답
 - 화면에 표시되는 window를 포함하여 앱의 모든 window를 관리
 - Process Lifecycle, UI Lifecycle 관리
 
 [13버전 이후]

 window의 개념이 scene으로 대체되고 하나의 앱에 여러개의 scene을 가질수있음
 짧게 말하자면 Ipad에서 하나의 메모장앱을 동시에 2개를 작업할수있다. 하나의 앱으로 멀티태스킹이 가능하다.
 
 ApplicationDelegate
 - 시스템과 상호작용을 관린한다.
 - 13버전 이전의 ApplicationDelegate가 관리하던 Process Lifecycle을 관리한다. 더 이상 UI와 관련된 Lifecycle을 관리하지 않는다.
 - Scene Session의 추가와 삭제를 관리하는 Lifecycle 역할이 추가된다.
 - 다운로드 알림 등 앱 외부에서 발생하는 알림에 응답한다.
 
 SceneDelegate
 - scene기반 앱의 수명 주기 이벤트에 응답
 - 13버전 이전의 ApplicationDelegate가 관리하던 UI Lifecycle을 관리한다.
 - 3가지 상태
 Not Running(Unattached) - Foreground(InActive, Active) - Background(Suspend, Running)
 
 Foreground와 Background의 공통점: 앱이 메모리에 올라가있다.
 차이점: Foreground는 앱이 화면을 점유하고있지만 Background는 앱이 화면을 점유하고있지않다.
 
 Inactive: 사용자가 컨트롤하지못하는상태라면 InActive상태로 본다. 외부적인 요인에 의해 InActive가 될수있다. 이는 OS가 직접 컨트롤한다.
 ex) 문자메세지나 전화가 와서 컨트롤이안되는경우
 
 Active: 일반적으로 앱을 사용하고있는 상태를 말한다.
 
 (Background)Running: 정확한 명칭은 앞에 background가 붙는다.
 음악을 틀고 홈버튼을 눌렀을때 계속 들을수있는것처럼 화면상에는 보이지않지만 background에서 실행이 되는 상태
 또는 GPS로 위치를 측정하는 상태로 볼수 있다.
 애플에서 사용자를 악성코드로부터 보호하기위한 보안상의 이유로 굉장히 제한적이다.
 만약 BackgroundRunning에서 하던 작업을 마무리하지 못하게된다면 Timeout때 마지막 함수를 호출할수있다. 그러고나서 메모리에서 지워진다.
 ex) 파일을 보내는데 실패하여 실패했다는 메시지를 띄어주거나 임시저장소에 저장하는상황
 그런데 Background에서 작업을 완료했다면 Suspend로 넘어가 대기상태로 전환한다.
 
 Suspend: 아무것도 안하고 계속 대기하고있는상태
 Background Running때 추가적인 작업을 하지않으면 곧바로 Suspended 상태로 진입
 이 상태에서는 그저 사용자가 다시 호출할때까지 계속 기다리게 된다.
 이때 메모리가 부족하게되면 OS의 판단하에 메모리에서 지워버린다.
 
 */
