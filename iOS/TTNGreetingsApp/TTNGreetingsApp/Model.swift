//
//  Model.swift
//  TTNGreetingsApp
//
//  Created by TTN on 31/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import Foundation

extension Date {
    var currentDate: String {
        let dateOfJoining = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd.MM.yyyy"
        let result = dateformatter.string(from: dateOfJoining)
        return result
    }
}

struct Employee {
    var emailID: String
    var phoneNum: String
    var employeeID: String
    var fname: String
    var lname: String
    var userDP: String
    var userRole: String
    var dateOfJoining: String
    var ID: String
    var address: String
    
    init(emailID: String, phoneNum: String, employeeID: String, fname: String, lname: String, userDP: String, userRole: String, dateOfJoining: Date, ID: String, address: String) {
        self.emailID = emailID
        self.phoneNum = phoneNum
        self.employeeID = employeeID
        self.fname = fname
        self.lname = lname
        self.userDP = userDP
        self.userRole = userRole
        self.dateOfJoining = dateOfJoining.currentDate
        self.ID = ID
        self.address = address
    }
}

struct Customer {
    var emailID: String
    var name: String
    var phoneNum: String
    var userDP: String
    var ID: String
    var address: String
    
    init(emailID: String, phoneNum: String, name: String, userDP: String, ID: String, address: String) {
        self.emailID = emailID
        self.phoneNum = phoneNum
        self.name = name
        self.userDP = userDP
        self.ID = ID
        self.address = address
        
    }
}

class Model: NSObject {
    var emp: [Employee] =
        [Employee.init(emailID: "kavya@gmail.com", phoneNum: "1234567", employeeID: "1", fname: "Kavya", lname: "Casshyap", userDP: "kavya", userRole: "Trainee", dateOfJoining: Date(), ID: "1", address: "New Delhi"),
        Employee.init(emailID: "aryan@gmail.com", phoneNum: "234567", employeeID: "2", fname: "Aryan", lname: "Sethi", userDP: "aryan", userRole: "Trainee", dateOfJoining: Date(), ID: "2", address: "Agra"),
        Employee.init(emailID: "rahul@gmail.com", phoneNum: "345678", employeeID: "3", fname: "Rahul", lname: "Sharma", userDP: "rahul", userRole: "Trainee", dateOfJoining: Date(), ID: "3", address: "New Delhi"),
        Employee.init(emailID: "vijender@gmail.com", phoneNum: "456789", employeeID: "4", fname: "Vijender", lname: "Singh Negi", userDP: "vij", userRole: "Trainee", dateOfJoining: Date(), ID: "4", address: "Dehradun"),
        Employee.init(emailID: "harsh@gmail.com", phoneNum: "567890", employeeID: "5", fname: "Harsh", lname: "Agarwal", userDP: "harsh", userRole: "Trainee", dateOfJoining: Date(), ID: "5", address: "New Delhi")]
    
    var cust: [Customer] =
        [Customer.init(emailID: "apple@icloud.com", phoneNum: "000012", name: "Steve Jobs", userDP: "stevejobs", ID: "101", address: "US"),
         Customer.init(emailID: "sony@sonyTV.com", phoneNum: "000023", name: "Akio Morita", userDP: "akiomorita", ID: "102", address: "Japan"),
         Customer.init(emailID: "nokia@nokiap.com", phoneNum: "000034", name: "Leo Mechelin", userDP: "leomechlin", ID: "103", address: "Finland"),
         Customer.init(emailID: "samsung@samsungp.com", phoneNum: "000045", name: "Lee Byung-chul", userDP: "lee", ID: "104", address: "Korea"),
         Customer.init(emailID: "vivo@vivop.com", phoneNum: "000056", name: "Shen Wei", userDP: "shen", ID: "105", address: "China"),]
    

}
