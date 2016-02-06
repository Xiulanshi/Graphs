//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func addUpIter(num:Int) -> Int {
    var ans = 0
    for i in (1...num) {
        ans += i
    }
    return ans
}
func addUpRecursive(num: Int) -> Int {
    if num == 0 { return 0 }
    return num + addUpRecursive(num - 1)
}

addUpIter(5)
addUpRecursive(5)

func factorial(num:Int) -> Int {
    var ans = 1
    for var n = 1; n<=num; n++ {
        ans*=n
    }
    return ans
}
func factorialR(num: Int) -> Int {
    if(num == 1) { return 1 }
    return num * factorial(num-1)
}
factorial(5)
factorialR(5)
