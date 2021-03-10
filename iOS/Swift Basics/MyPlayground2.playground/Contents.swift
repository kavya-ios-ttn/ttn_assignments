import UIKit
struct name {
    var firstName: String
    var lastName: String
    init(fname firstName: String, lname lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
var Na = name(fname: "Kavya", lname: "Casshyap")
print("The name is \(Na.firstName) \(Na.lastName)")
