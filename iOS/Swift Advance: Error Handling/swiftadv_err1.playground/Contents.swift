import UIKit
////Question 1
//protocol err: LocalizedError {}
//
//enum errTest: err {
//    case one(Int)
//    case two(Int)
//    case three
//}
//
//func errCheck(number: Int) throws {
//    if number > 50 {
//        throw errTest.one(number)
//    } else if number < 10 {
//        throw errTest.two(number)
//    } else {
//        print("Your number is g enough!")
//    }
//}
//do {
//    try errCheck(number: 5)
//} catch  errTest.one {
//    print("Your number is greater than 50.")
//} catch errTest.two {
//    print("Your number is less than 10.")
//}

//Question 2

//enum FriendsChar: String {
//    case one = "Joey"
//    case two = "Ross"
//}
//enum errName: Swift.Error {
//    case initalizationFailed
//}
//
//struct Habits {
//    var friendschar: FriendsChar = .one
//    init?(word: String) throws {
//        guard let centralperk = FriendsChar(rawValue: word) else {
//            throw errName.initalizationFailed
//        }
//        self.friendschar = centralperk
//    }
//}
//
//do {
//    _ = try Habits(word: "")
//} catch errName.initalizationFailed {
//    print("Object not able to initialise.")
//}


//Question 3

//enum FriendsChar: String {
//    case joey = "joey"
//    case ross = "ross"
//}
//enum errName: Swift.Error {
//    case initalizationFailed
//}
//
//struct profession {
//    var friendschar: FriendsChar = .joey
//    init?(word: String) throws {
//        guard let centralperk = FriendsChar(rawValue: word) else {
//            throw errName.initalizationFailed
//        }
//        self.friendschar = centralperk
//    }
//}
//let doctor = try? profession(word: "")
//let actor = try? profession(word: "joey" )


//Question 4
struct employee{
    var empID : Int
    var empName : String
    var empEmail : String
    var yearsOfExperience : Double
    var isPresent : Bool
    var competency : String
    var attendancePercentage : Int
}

let empInfo: [employee] = [employee(empID: 101, empName: "Joey", empEmail: "joey@tothenew.com", yearsOfExperience: 3 , isPresent: true, competency: "iOS", attendancePercentage: 90),

                                employee(empID: 102, empName: "Ross", empEmail: "ross@tothenew.com", yearsOfExperience: 2, isPresent: true, competency: "iOS", attendancePercentage: 85),

                                employee(empID: 103, empName: "Rachel", empEmail: "rachel@tothenew.com", yearsOfExperience: 4.5, isPresent: true, competency: "AI", attendancePercentage: 89),

                                employee(empID: 104, empName: "Phoebe", empEmail: "phoebe@tothenew.com", yearsOfExperience: 1, isPresent: true, competency: "Android", attendancePercentage: 75),

                                employee(empID: 105, empName: "Chandler", empEmail: "chandler@tothenew.com", yearsOfExperience: 5, isPresent: false, competency: "android", attendancePercentage: 97),

                                employee(empID: 106, empName: "Monica", empEmail: "monica@tothenew.com", yearsOfExperience: 6, isPresent: true, competency: "BigData", attendancePercentage: 70),

                                employee(empID: 107, empName: "Mithlesh", empEmail: "mithlesh@tothenew.com", yearsOfExperience: 1.5, isPresent: true, competency: "BigData", attendancePercentage: 81),

                                employee(empID: 108, empName: "Merry", empEmail: "merry@tothenew.com", yearsOfExperience: 1.8, isPresent: true, competency: "iOS", attendancePercentage: 85),

                                employee(empID: 109, empName: "Ankit", empEmail: "ankit@tothenew.com", yearsOfExperience: 2, isPresent: true, competency: "QE", attendancePercentage: 75),

                                employee(empID: 110, empName: "Sachin", empEmail: "sachin@tothenew.com", yearsOfExperience: 3.5, isPresent: true, competency: "AI", attendancePercentage: 87)]

enum bonusErr: Error{

    case isPresentorNot (String)
    case yeo (String)
    case CompetencyNotHot (String)
    case attendance (String)
    var localDescription: String{

        switch self {

        case .isPresentorNot(let name):

            return name

        case .yeo(let name):

            return name

        case .CompetencyNotHot(let name):

            return name

        case .attendance(let name):

            return name
        }
    }
}

class bonus {

    func BonusAllowed(bonusemail : String) throws -> Void {
        var item: employee {
            var obj: employee? = nil
            for ob in empInfo where bonusemail == ob.empEmail {
                obj = ob
            }
            return obj!
        }

        if item.isPresent == true{

                if item.yearsOfExperience > 1 {

                    if item.competency == "iOS" || item.competency == "android" || item.competency == "BigData" || item.competency == "AI"{

                        if item.attendancePercentage > 80 {
                            print ("\(item.empName) is eligible for bonus!")
                        } else {
                            throw bonusErr.attendance(item.empName)
                        }
                    } else {
                        throw bonusErr.CompetencyNotHot(item.empName)
                    }
                }
                else {

                    throw bonusErr.yeo(item.empName)
                }
            }
            else {
                throw bonusErr.isPresentorNot(item.empName)
            }
        }
}

let bonusProgram = bonus()

do {

    let _ = try bonusProgram.BonusAllowed(bonusemail: "mithlesh@tothenew.com")

    let _ = try bonusProgram.BonusAllowed(bonusemail: "merry@tothenew.com")

    let _ = try bonusProgram.BonusAllowed(bonusemail: "rachel@tothenew.com")

    let _ = try bonusProgram.BonusAllowed(bonusemail: "phoebe@tothenew.com")

    let _ = try bonusProgram.BonusAllowed(bonusemail: "ankit@tothenew.com")

} catch bonusErr.isPresentorNot(let name){

    print(name + " is absent today")

} catch bonusErr.CompetencyNotHot(let name){

    print(name + " competancy does not fall under bonus program.")

} catch bonusErr.yeo(let name){

    print(name + " is still to complete a year with us")

} catch bonusErr.attendance(let name) {

    print(name + " has attendance less than 80")

}





