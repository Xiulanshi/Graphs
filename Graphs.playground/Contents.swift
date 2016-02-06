//: Playground - noun: a place where people can play

import UIKit

// Difference between struct and class
class SomeClass {
    var val: Int
    init(val: Int) {
        self.val = val
    }
}

struct SomeStruct {
    var val : Int
}

var s = SomeStruct(val: 5)
var c = SomeClass(val: 5)

//duplicate and make a copy, it doesn't point to s
var scopy = s
//take c and point to c
var cRef = c

scopy.val = 1
cRef.val = 1

print(s.val)
print(c.val)

