import UIKit

struct PersonalInfo {
    var empID = 102
    var name: String
    var country: String
    var address: String
    var hobbies: String
    
    mutating func part1(country c:String) {
        print("The emp ID is\(empID)")
}
    
   


var emp1 = PersonalInfo(empID:101, name: "Joey", country: "America", address: "CentralPerk", hobbies: "Eating")
        emp1.part1(country:"India")
        print("Now (\(emp1.empID))")
var emp2 = PersonalInfo(empID: 102, name: "Ross", country: "China", address: "Avenue", hobbies: "Reading")
var emp3 = PersonalInfo(empID: 103, name: "Sid", country: "India", address: "Vasant Vihar", hobbies: "Gaming")
var emp4 = PersonalInfo(empID: 104, name: "Samar", country: "India", address: "GK", hobbies: "Cooking")
        
        
        
        struct Point {
            var x = 0.0, y = 0.0
            mutating func moveBy(x deltaX: Double, y deltaY: Double) {
                x += deltaX
                y += deltaY
            }
        }
        var somePoint = Point(x: 1.0, y: 1.0)
        somePoint.moveBy(x: 2.0, y: 3.0)
        print("The point is now at (\(somePoint.x), \(somePoint.y))")
        // Prints "The point is now at (3.0, 4.0)"
        

struct ProfessionalInfo {
    var empID: Int
    var name: String
    var dept: String
    var branch: String
    var exp: Int
    }

        _ = ProfessionalInfo(empID: 101, name: "Joey", dept: "iOS" , branch: "America", exp: 5)
        _ = ProfessionalInfo(empID: 102, name: "Ross", dept: "JVM", branch: "Britain", exp: 2)
        _ = ProfessionalInfo(empID: 103, name: "Sid" , dept: "iOS", branch: "India", exp: 1)
        _ = ProfessionalInfo(empID: 104, name: "Samar", dept: "Full Stack", branch: "India", exp: 3)
}
}





//init(empID: Int, name: String, country: String, address: String, hobbies: String) {
  //self.empID = empID
  //self.name = name
  //self.country = country
  //self.address = address
  //self.hobbies = hobbies
//}

func part1() {
    if self.country=="India" {
        print("The emp ID is\(empID)")
}

