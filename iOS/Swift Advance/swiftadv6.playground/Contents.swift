import UIKit

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var someInt1 = 3
var anotherInt1 = 107
swapTwoValues(&someInt1, &anotherInt1)
print("someInt is now \(someInt1), and anotherInt is now \(anotherInt1)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print("someInt is now \(someString), and anotherInt is now \(anotherString)")
