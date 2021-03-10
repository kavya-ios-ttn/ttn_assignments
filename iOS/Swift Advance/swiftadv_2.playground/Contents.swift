import UIKit

class example {
    weak var delegate: UITextField?
    var str: String = "Hey"
    delegate.text = str
    var name: String
    
    init(delegate: UITextField, name: String) {
        self.delegate = delegate
        self.name = name
    }
}
extension example {
    convenience init() {
        self.init(delegate:"", name: "Kavya")
   
    }
}
var e = example()
print(e.name)
print(e.delegate ?? "Hey")


class A {
    
    var name : String
    var age : Int
    
    init(name: String, age: Int) {
        self.age = age
        self.name = name
    }
}

extension A {
    
    convenience init() {
        self.init(name: "No name yet", age: 0)
    }
}

var a = A()
print(a.name) //prints "No name yet"
print(a.age) //prints 0

