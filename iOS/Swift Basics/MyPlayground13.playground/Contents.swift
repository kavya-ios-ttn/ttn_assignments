import UIKit

enum nameError: Error {
    case noName
}

struct companyName {
    let compName: String
    
    init(name:String) throws {
        if name.isEmpty {
            throw nameError.noName
        }
        self.compName = name
    }
}

do {
    let myComp = try companyName(name: "To The New")
    myComp.compName
}
catch nameError.noName {
    print("To The New is the company name.")
}
