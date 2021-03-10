import UIKit

class calculator {
    
}

enum calc : Int {
    case multiplication
    case subtraction
    case addition
    case squareroot
    case division
}

print("The value of \(calculator.multiplication.self)")

// lets change raw values - explain
// init enum by raw value
let c =  calculator.init(calc: 1)

// how to write better way for this
switch c! {
case calc.multiplication: 
    print(0)
case RawValueTextAlignment.right:
    print(1)
case RawValueTextAlignment.center:
    print(2)
case RawValueTextAlignment.justify:
    print(3)
    
}
