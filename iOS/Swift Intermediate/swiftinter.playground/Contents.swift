import UIKit

var numbers = [0,1,2,3,4,5,6,7,8,9,10]
var evenArray = numbers.filter {(anElement)-> Bool in
anElement % 2 == 0
}

print(evenArray)

var oddArray = numbers.filter {$0 % 2 != 0}
print(oddArray)

var mappedArray = numbers.map{ (anElement)-> Int in
anElement*10
}
print(mappedArray)

let reduced = numbers.reduce(0) { (res, anElement) -> Int in
    res + anElement
}
print(reduced)
