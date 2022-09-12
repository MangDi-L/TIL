//
//  main.swift
//  #17 화면이동
//
//  Created by Mangdi on 2022/09/12.
//

import Foundation

// #17 화면이동 (1/2)

/*
 스토리보드에서 화면을 이동하는방법은 여러가지방법이 있다.
 버튼을 ctrl누른상태에서 연결할 뷰로 드래그해도 되고, 코드로 구현해도된다.
 다만 다음화면으로 데이터를 전달하거나 다시 돌아왔을때 데이터를 또 받아야한다면 코드로 구현해야 가능하다.
 
 오늘은 코드로 화면전환 하는법을 기록할것이다.
 특히 VC(ViewController) 에서 VC으로 이동하는 일반적인게 아니라
 VC에서 NC(NavigationController)에 연결된 VC로 이동하는법을 설명할것이다.
 ex) NC - VC
           |
          NC - VC
 이런식으로 연길이되었다고 가정하고 시작하겠다.
 
 첫번째 방법
 */
// 첫번째 VC에서 두번째 VC로 넘어가는 버튼을 눌렀을때 호출되는 메서드다.
// modifyStockNC가 storyboard가 "ModifyStockNC"인 NC를 찾아서 ModifyStockNavigationController 유형인지 물어보고
// 맞다면 다음줄 modifyStockVC가 modifyStockNC의 topViewController(
// UINavigationController에서 사용할수있는 속성이며 스택의 가장 위에있는 VC를 반환함)를 ModifyStockViewController의 유형인지 물어보고
// 맞다면 self.navigationController?.present(modifyStockNC, animated: true)로 화면을 이동할수있습니다.

//@IBAction func moveModifyStockView(sender: UIButton) {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    guard let modifyStockNC = storyboard.instantiateViewController(withIdentifier: "ModifyStockNC") as? ModifyStockNavigationController,
//          // visibleViewController 또는 topViewController 둘중 하나 골라서 사용 가능
//          let modifyStockVC = modifyStockNC.topViewController as? ModifyStockViewController else {
//        return
//    }
//
//    self.navigationController?.present(modifyStockNC, animated: true)
//}
/*
 만약 NC - VC - VC 이런식으로 가려고한다면
 guard let 처음부분을 NC에서 VC로 바꾸고 필요없는 아래 let을 지우고 present하면 된다.
 두번째 방법은 세그를 이용하는방법인데 필자는 두번째 방법을 추천한다.
 다음 TIL에서 두번째 방법을 기록하겠다.
 */
