//
//  main.swift
//  #18 화면이동2
//
//  Created by Mangdi on 2022/09/13.
//

// #18 화면이동 (2/2)
/*
 저번 화면이동 첫번째 방법에 이어 두번째 방법을 설명하겠다.
 먼저 사전작업이 있다. 버튼을 ctrl을 누른상태에서 넘어가려는 다음 화면으로(NC로) 마우스를 끌어다놓으면
 화살표 비스무리한것이 생길것이다. 그것을 세그라고하며 그것을 가지고 코드상에서 화면을 이동할것이다.
 그다음 아래의 코드를 보자
 */

//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "NCSegue" {
//        guard let nc = segue.destination as? ModifyStockNavigationController,
//              // visibleViewController 또는 topViewController 둘중 하나 골라서 사용 가능
//              let vc = nc.visibleViewController as? ModifyStockViewController else { return }
//        vc.strawberryCount = strawberryCountLabel.text
//        vc.bananaCount = bananaCountLabel.text
//        vc.pineappleCount = pineappleCountLabel.text
//        vc.kiwiCount = kiwiCountLabel.text
//        vc.mangoCount = mangoCountLabel.text
//    }
//}
/*
 prepare메소드를 오버라이드하면 자동으로 함수가 생성된다. 세그로 연결한 버튼을 누를때 호출되는 메서드다.
 if문에 연결한 세그의 id값을 확인하고 해당세그의 destination, 목적지가 ModifyStockNavigationController(NC)인
 nc값을 가지고 visibleViewController로 가지고있는 ModifyStockViewController(VC)를 꺼내서
 꺼내온 vc에 저런식으로 값을 전해줄수 있다.
 
 첫번째 방법과 달리 2번째 방법을 추천한 이유는 스토리보드상에서 연결된 세그를 통해 한눈에 어디로 이동할수있는지 알수있고,
 어떠한 알람을 띄울때 알람의 핸들러에 performSegue()만 써주면 위에 작성해놓은 prepare을 실행시켜서 값과 함께 화면을 쉽게 넘어갈수 있다.
 ex) performSegue(withIdentifier: "NCSegue", sender: nil)
 정답은 없으며 자신이 원하는 방법대로 작성해나가는것이 좋을것이다.
 */
