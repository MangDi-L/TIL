//
//  main.swift
//  #29 unowned
//
//  Created by Mangdi on 2022/10/05.
//

import Foundation

// #29 unowned

/*
 이전 TIL에서 weak에 대해서 알아보았다.
 이번에는 weak랑 비슷한 성질을 가진 unowned에 대해 작성하겠다.
 
 unowned도 마찬가지로 강한참조순환을 해결할수있는 녀석이다.
 weak랑 똑같이 RC도 카운트하지 않는다.
 그럼 대체 무엇이 다르냐?
 weak는 인스턴스가 해제될때 nil이 반환되지만 unowned는 nil 반환이 안된다.
 즉, 인스턴스가 해제되어도 인스턴스가 존재했던 메모리의 주소값을 계속 가지고있다는 뜻이다.
 아래 코드를 보자
 */

class Person {
    let name: String
    weak var havePhone: Phone?

    init(name: String) {
        self.name =  name
    }

    deinit { debugPrint("person 해제") }
}

class Phone {
    let brand: String
    var attribution: Person?

    init(brand: String) {
        self.brand = brand
    }

    deinit { debugPrint("phone 해제") }
}

var mangdi: Person? = Person(name: "mangdi") // Person RC + 1
var iphone11: Phone? = Phone(brand: "apple") // Phone RC + 1

mangdi?.havePhone = iphone11
iphone11?.attribution = mangdi // Person RC + 1

iphone11 = nil // Phone RC - 1 , "phone 해제"
debugPrint(mangdi?.havePhone?.brand) // nil

/*
 Person의 havePhone에 weak를 달아주었다. 위와 같은 코드를 진행해보면
 iphone11 = nil로 Phone의 RC가 0이되어 deinit "phone 해제"을 출력하는것을 볼수있다.
 그리고나서 havePhone에는 자동으로 nil이 할당되는것을 알수있다.
 이제 weak대신 unowned를 사용해보겠다.
 */

//class Person {
//    let name: String
//    unowned var havePhone: Phone?
//    
//    init(name: String) {
//        self.name =  name
//    }
//    
//    deinit { debugPrint("person 해제") }
//}
//
//class Phone {
//    let brand: String
//    var attribution: Person?
//    
//    init(brand: String) {
//        self.brand = brand
//    }
//    
//    deinit { debugPrint("phone 해제") }
//}
//
//var mangdi: Person? = Person(name: "mangdi") // Person RC + 1
//var iphone11: Phone? = Phone(brand: "apple") // Phone RC + 1
//
//mangdi?.havePhone = iphone11
//iphone11?.attribution = mangdi // Person RC + 1
//
//iphone11 = nil // Phone RC - 1 , "phone 해제"
//debugPrint(mangdi?.havePhone?.brand) // error

/*
 Fatal error로 "object 0x101158490 was already deallocated" 이런구문을 볼수있다.
 해당 인스턴스는 이미 해제되어서 찾을수가없다는 오류다.
 
 이렇듯 인스턴스가 해제될때 nil을 할당받지않는것을 알수있다.
 알고보니 unowned는 weak에 비해 문제점이 많은것같다.
 그럼에도 swift는 왜 unowned란 기능을 지원하는걸까?
 그 이유는 오버헤드가 weak보다 적기 때문이다.
 
 unowned를 사용할때는 일종의 약속 하나를 하고 사용하는셈이다.
 바로 메모리에서 해제되지않고 오래오래 장수하는 인스턴스를 대상으로말이다.
 
 그렇기 때문에 코드를 실행할때마다 weak로 설정된 아이는 죽었는지 살았는지 확인하며 nil을 반환해줄까말까 하는 과정을 거쳐야 하는반면,
 unowned는 '어차피 계속 살아있을 아이'로 보기때문에 죽엇는지 살았는지 확인해주는 과정이 필요없다.
 이래서 weak에 비해 오버헤드가 적을수밖에 없다.
 
 하지만 앞으로 코딩할때 unowned를 쓸일은 자주 없을것같다...
 */
