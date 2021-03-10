import UIKit

//let hd = resolution (width: 1020, height: 1080)
//var cinema = hd



var repeatingValues = Array(repeating: [1,2,3], count: 3)
print(repeatingValues)


var hello: Array<Int> = Array()
print(hello)



//empty disctionary
var dict: [String:Int] = [:]
    print(dict)
dict.updateValue(1, forKey: "hey")
print(dict)

//with values
var dictValues: [Int:Int] = [1:1, 2:2, 3:3]



func name(person para: Int) -> Int {
    let a = para
    let b = 3
    return a+b
}
let h = name(person: 2)


//closure
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
reversedNames = names.sorted(by:
    {(s1: String, s2: String)-> Bool in
        return s1>s2
})


//enum
/

//extensions

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect{
    init(center: Point, size: Size) {
            let originX = center.x - (size.width / 2)
            let originY = center.y - (size.height / 2)
            self.init(origin: Point(x: originX, y: originY), size: size)
        }
    }



//map

