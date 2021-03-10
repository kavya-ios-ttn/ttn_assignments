import UIKit

enum calculate{
    case double (Double)
    case int (Int)
}

struct calculator{
    var a: Int
    var b: Int
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
    init(a: Int) {
        self.a = 0
        self.b = 0
    }
    func addition(_ add: (Int, Int) -> Int) {
        print("Result is \(add(a,b))")
    }
    func subtraction(_ sub: (Int, Int) -> Int) {
        print("Result is \(sub(a,b))")
    }
    func division(_ div: (Int, Int) -> Int) {
        print("Result is \(div(a,b))")
    }
    func multiplication(_ multiply: (Int, Int) -> Int) {
        print("Result is \(multiply(a,b))")
    }
    func squareRoot(_ root: (Double) -> Double) {
        print("Result is \(root(Double(a)))")
    }
}

    func add(a: Int, b: Int) -> Int {
        return a+b
    }
    func sub(a: Int, b: Int) -> Int {
        return a-b
    }
    func div(a: Int, b: Int) -> Int {
        return a/b
    }
    func multiply(a: Int, b: Int) -> Int {
        return a*b
    }
    func root(a: Double) -> Double {
        return (sqrt(Double(a)))
    }

calculator(a: 10, b: 5).addition(add)
calculator(a: 10, b: 5).subtraction(sub)
calculator(a: 10, b: 5).division(div)
calculator(a: 10, b: 5).multiplication(multiply)
calculator(a: 4).squareRoot(root)




