//
//  main.swift
//  #19 String format
//
//  Created by Mangdi on 2022/09/15.
//

import Foundation

// #19 String format
/*
 문자열을 나타낼때 직접 프린트문에 나타내기보단 변수나 상수에 할당해서 나타내는방법이 더 좋다는것은 동의할것이다.
 그때 format을 이용하면 용도에 맞게 잘 출력해준다. 아래 예시를 보자.
 */
print(String(format: "i'm, %@", "mangdi")) // i'm, mangdi
print(String(format: "my age is %d", 5)) // my age is 5
// %@으로 문자열을 넣어줄수 있고 @d로 숫자를 넣어줄수있다.

let habby = "playing game"
let live = "korea"
let year = 1900
let sentence = "my hobby is %3$@ and live in %2$@ since %1$d" // my hobby is playing game and live in korea since 1900
print(String(format: sentence, year, live, habby))
// format에 인자로 들어오는 순서대로 1$ 2$ 3$ 에 기입한다.
