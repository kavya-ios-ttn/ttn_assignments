import UIKit

struct Person {
    var name : String

    var age : Int

}

let person1 = Person(name: "Joey", age: 26)

let person2 = Person(name: "Chandler", age: 24)

let person3 = Person(name: "Ross", age: 28)

let person4 = Person(name: "Mike", age: 25)

let personArray = [person1, person2, person3, person4]

let p: [Person] = personArray.filter {
    i in personArray.contains { _ in i.age > 25} }
print(p)

