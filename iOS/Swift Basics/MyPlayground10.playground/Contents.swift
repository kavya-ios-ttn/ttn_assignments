import UIKit

@propertyWrapper
struct nonNegavtive {
    var v: Int
    
    init(wrappedValue: Int) {
        if wrappedValue < 0 {
            self.v = 0
        } else {
            self.v = wrappedValue
        }
    }
    
    var wrappedValue: Int {
        get{ v }
        set{
            if newValue < 0 {
                v = 0
            } else {
                v = newValue
            }
        }
    }
}

struct temp {
    @nonNegavtive var v = 0
}

var t = temp()
t.v += 1890
print(t.v)

t.v -= 1890
print(t.v)
