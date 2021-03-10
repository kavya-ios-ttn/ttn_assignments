import UIKit


protocol NameProvidable { //provides a name
    var name: String { get }
    
}

protocol Identifiable { //gives an ID
    var id: Int {get}
}


protocol PersonType: NameProvidable, Identifiable { //NameProvidable is a protocol
    var age: Int { get }
    var address: String {get}
    func getDescription() -> String     //can be a mix of properties and functions
}

struct Person : PersonType {
    var id: Int
    let name: String
    let age:Int
    let address: String
    
    func getDescription() -> String {
        return "id:\(id) name:\(name) address:\(address), age: \(age)"
    }
}


protocol AnimalType: NameProvidable{}

struct Animal: AnimalType {
    var name: String
}

let p1 = Person(id: 1, name: "A", age: 10, address: "Add 1")
let p2 = Person(id: 2, name: "B", age: 20, address: "Add 2")
let p3 = Person(id: 3, name: "C", age: 30, address: "Add 3")

p1.name = "AA"
p1.age = 1

print(p1.getDescription())

let a1 = Animal(name: "Lion")

func getName(_ nameProvidable: NameProvidable) -> String {
   return nameProvidable.name
}

extension PersonType {
    mutating func updateName(_ name: String) -> String {
        self.name = name
        
    }
}
print(getName(p1))

let updateName = p1.updateName("ZZ")
print(p1.name)

//===============================
protocol FullNameProvidable {     //instanciated property
    var firstName: String {get}
    var lasttName: String {get}
    var fullName: String {get}
}

//computed property
extension FullNameProvidable {         //extension of protocol to give full name
    var fullName: String {
        return firstName + "" + lasttName  //default implementation by making an extension of full name separately
    }                                 //increases reusability
}

struct PersonA : FullNameProvidable {
    var firstName: String
    var lasttName: String
   
    
}

struct PersonB : FullNameProvidable {
    var firstName: String
    var lasttName: String
    var fullName: String {
        "Hello" + firstName + " " + lasttName  //custom implementation by creating it there itself
    }
    
}

let pa1 = PersonA(firstName: "A", lasttName: "B")
print(pa1.fullName)

let pb1 = PersonB(firstName: "Y", lasttName: "X")
print(pb1.fullName)




//Protocol is value type by default
//to make it class type, write Any object in front of it

//part 2 static

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set}
    static func doSomething()
}

class StaticTest: AnotherProtocol {
    static var someTypeProperty: Int { 5}
    static func doSomething() {
        print("Do something")
    }

}

print(StaticTest.someTypeProperty)
StaticTest.doSomething()





/
protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    required init(someParameter:Int) {
        //initializer implementation goes here
    }
    
    protocol SomeProtocol1 {
        init()
    }
    
//    convenience init() {
//        self.init(someParameter: 1)
       
    class SomeSuperClass1 {
        init() {
    }
}

    class SomeSubClass: SomeSuperClass1, SomeProtocol1 {
        //required from someProtocol conforms; "override from someSuperClas
        required override init() {
            
        }
}



//Alert

    protocol AlertPresentable {
        func showAlert()
}

    extension AlertPresentable where Self: UIViewController {// presents type
        func showAlert() {
            let alert = UIAlertController(title: "temp", message: "msg", preferredStyle: .alert)
              self.present(alert, animated: true, completion: nil)
        }
    }
    
    class VC1: UIViewController, AlertPresentable {
        
}

    class VC2: UIViewController, AlertPresentable {
}
}





protocol A {
    var firstName: String { get}
}

protocol B {
    var lastName: String { get}
}

func printFullName(_ some: A & B) { //conforms to both A and B
    
    print(some.firstName + " " + some.lastName)
}



//Associated

protocol ItemAddable {
    associatedtype T
    var items: [T] {get}
    mutating func addItem(item: T)
}

struct stacks: ItemAddable {
    typealias T = Any
    var items: [Any]
    
    mutating func addItem(item: Any) {
        items.append(item)
    }
}

struct Queue: ItemAddable {
    typealias T = Any
    var items: [Any]
    
    mutating func addItem(item: Any) {
        items.insert(item, at: 0)
    }
}


