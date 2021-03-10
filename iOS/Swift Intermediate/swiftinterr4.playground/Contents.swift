import UIKit

enum Activity {
    case dance
    case academic
    case run
    case sing
    case fights

    func enumFuntion() -> String {
        switch self {
        case .dance:
            return " is dancing."
        case .academic:
            return "is studying."
        case .run:
            return "is running."
        case .sing:
            return "is singing."
        case .fights:
            return "is fighting."
        }
    }

    func FilterofEnum(_ traineeName: String, traineeObject: (String) -> Void) {
        traineeObject(traineeName)
    }
}

struct Trainee {
    var name: String
    var dance: Int?
    var run: Int?
    var sing: Int?
    var fight: Int?
    var academic: Int?

}

var trainee: [Trainee] = [Trainee(name: "Waseem", run: 70), Trainee(name: "Anindiya", academic:45 ),Trainee(name: "Rekha", run: 75)]


class TraineeActivity {
    lazy var traineeData: [Trainee] = {
        return trainee }()

    var recordedTrainees: [Trainee] = []

    func performActivity(traineeName name: String, activity en: Activity) {
        var traineeObj: Trainee? = nil
        en.FilterofEnum(name) { (name) in
            for data in traineeData where data.name == name {

                traineeObj = data
            }
        }

        if traineeObj != nil {
            print("\(traineeObj?.name ?? "not") good \(en) \(traineeObj?.run)")
            recordActivity(trainee: traineeObj!)
        }
    }

    func recordActivity(trainee traineeObject: Trainee) {
        recordedTrainees.append(traineeObject)
    }

    func rerunActivity() {
        for item in recordedTrainees {
            print(item)
        }
    }
}

var object = TraineeActivity()

object.performActivity(traineeName: "Waseem", activity: .run)
object.performActivity(traineeName: "Anindiya", activity: .academic)
object.performActivity(traineeName: "Rekha", activity: .run)
object.rerunActivity()
