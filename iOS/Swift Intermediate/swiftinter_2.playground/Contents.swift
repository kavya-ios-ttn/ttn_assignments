import UIKit
enum calculate {
    case multiply (Int, Int)
    case subtraction (Int, Int)
    case addition (Int, Int)
    case squareRoot (Float)
    case division (Int, Int)
}
class Calculator {
    func equals (_ equal: calculate)-> Int {
    switch equal {
    case let .multiply(a, b):
        return (a*b)
    case let .subtraction(a,b):
        return (a-b)
    case let .addition(a, b):
        return (a+b)
    case let .division(a, b):
        return (a/b)
    case let .squareRoot(a):
        return (Int(sqrt(a)))
    }
}
}
var obj = Calculator()
let add = obj.equals(.addition(1, 6))
let multi = obj.equals(.multiply(4, 4))
let div = obj.equals(.division(10, 5))
let sqroot = obj.equals(.squareRoot(20))
let subt = obj.equals(.subtraction(33, 3))
print(add)
print(multi)
print(div)
print(sqroot)
print(subt)

