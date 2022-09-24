//
//  main.swift
//  #24 flatMap, compactMap
//
//  Created by Mangdi on 2022/09/24.
//

import Foundation

// #24 flatMap, compactMap
/*
 compactMap과 flatMap은 둘 다 nil을 제거해주고 옵셔널바인딩 처리를 해준다
 아래 코드로 map과 비교해보자
 */
let numberArray = ["1", "2", "+", "^", "-10", "one", ""]
let result = numberArray.map { Int($0) }
debugPrint(result) // [Optional(1), Optional(2), nil, nil, Optional(-10), nil, nil]

let result2 = numberArray.compactMap { Int($0) }
debugPrint(result2) // [1, 2, -10]

let result3 = numberArray.flatMap { Int($0) }
debugPrint(result3) // [1, 2, -10]

/*
 그렇다면 compactMap과 flatMap의 차이는 뭘까?
 */

let numberArray2 = [["1", ""], ["8", "$", "two"], ["+", "10"]]
debugPrint(numberArray2.flatMap { $0 })    // ["1", "", "8", "$", "two", "+", "10"]
debugPrint(numberArray2.compactMap { $0 }) // [["1", ""], ["8", "$", "two"], ["+", "10"]]

/*
 flatMap은 2차원배열에서 1차원배열로 한단계 더 내려온차원으로 배열을 반환한다.
 반면 compactMap은 2차원배열 그대로 반환해준다.
 1차원배열에서 flatMap을 사용할때 노랑색글씨로 'flatMap' is deprecated: Please use compactMap(_:) for the case where closure returns an optional value'
 이러한 글이 뜰텐데 이는 xcode에서 deprecated되서 추천하지 않는 함수라고 알려준다.
 근데 꼭 사용하지말라는건 아니니 1차원배열에서 옵셔널바인딩과 nil제거를 할때는 compactMap을,
 2차원배열을 1차원배열로 바꿀때는 flatMap을 사용하는게 좋을것같다.
 
 추가로 1차원배열에서는 compactMap과 flatMap 둘 다 nil제거와 옵셔널바인딩이 가능했는데
 2차원배열에서는 불가능하다 아래 코드를 보자.
 */

let numberArray3 = [[nil, "4"], ["three", nil]]
debugPrint(numberArray3.flatMap { $0 }) // [nil, Optional("4"), Optional("three"), nil]
debugPrint(numberArray3.compactMap { $0 }) // [[nil, Optional("4")], [Optional("three"), nil]]

let result4 = numberArray3.flatMap { $0 }.compactMap { $0 }
debugPrint(result4) // ["4", "three"]
debugPrint(result4.compactMap { Int($0) }) // [4]

/*
 이런식으로 flatMap과 compactMap을 적절히 사용하면서 원하는 값을 추출할수있다.
 */
