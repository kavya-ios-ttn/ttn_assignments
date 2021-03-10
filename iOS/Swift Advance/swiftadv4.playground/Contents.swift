import UIKit

enum Human: String {
    case one
    case two
    case three
}
extension Human {
    var mood: String {
        return self.rawValue
    }
    
    func disp() {
        switch self {
        case .one: print("I am fine.")
        case .two: print("I am good.")
        case .three: print("I am sad.")
        }
    }
}

print(Human.two.mood)
Human.three.disp()
