import UIKit

struct EmployeePersonal {
    var empID = 102
    var name: String
    var country: String
    var address: String
    var hobbies: String
    
    init(_ id: Int, _ name: String, _ country: String, _ address: String, _ hobbies: String) {
        self.empID = id
        self.name = name
        self.country = country
        self.address = address
        self.hobbies = hobbies
}
}

struct EmployeeProfessional {
var empID: Int
var name: String
var dept: String
var branch: String
var exp: Int

init(_ id: Int, _ name: String, _ dept: String, _ branch: String, _ exp: Int) {
        self.empID = id
        self.name = name
        self.dept = dept
        self.branch = branch
        self.exp = exp
}
}

var personalEmployees: [EmployeePersonal] = [EmployeePersonal(101, "Joey", "America", "CentralPerk","Eating"),
                                            EmployeePersonal(102, "Ross", "China", "Avenue", "Reading"),
                                            EmployeePersonal(103, "Sid", "India", "Vasant Vihar", "Gaming"),
                                            EmployeePersonal(104, "Samar", "India", "GK", "Cooking")]



var professionalEmployees: [EmployeeProfessional] = [EmployeeProfessional(101, "Joey", "iOS", "America", 5),
                                                     EmployeeProfessional(102, "Ross", "JVM", "Britain", 2),
                                                     EmployeeProfessional(103, "Sid", "iOS", "India", 1),
                                                     EmployeeProfessional(104, "Samar", "Full Stack", "India", 3),]



struct Employee {
    var id: Int
    var personalEmployee: EmployeePersonal
    var professionalEmployee: EmployeeProfessional
    
    init(ecid id: Int, personalEmployees: EmployeePersonal, professionalEmployees: EmployeeProfessional) {
        self.id = id
        self.personalEmployee = personalEmployees
        self.professionalEmployee = professionalEmployees
        
    }


    func displayInfo() {
        print("Emp ID:", self.id)
        print("Name:", self.personalEmployee.name)
        print("Address:", self.personalEmployee.address)
        print("Country:", self.personalEmployee.country)
        print("Hobbies:", self.personalEmployee.hobbies as Any)
        print("Department:", self.professionalEmployee.dept)
        print("Branch:", self.professionalEmployee.branch)
        print("Experience:", self.professionalEmployee.exp)
        print("\n")
        
    }
}

var employees: [Employee] = []

for item in zip(professionalEmployees, personalEmployees) {
    if(item.0.empID == item.1.empID) {
        employees.append(Employee(ecid: item.0.empID, personalEmployees: item.1 , professionalEmployees: item.0))
    }
}

for employee in employees {
    employee.displayInfo()
}

//Question 2

func employeeList(personalE: [EmployeePersonal], professionalE: [EmployeeProfessional], country: String) {
    var listOfEmployees: [String] = []
    for item in zip(personalE, professionalE) where (country == item.0.country) {
    listOfEmployees.append(item.0.name)
    }
for name in listOfEmployees {
    print("\(name) is in \(country)")
    }
    print("\n")
}

var argCountry = "India"
employeeList(personalE: personalEmployees, professionalE: professionalEmployees, country: argCountry)


//Question 3

func employeeListDept(personalE: [EmployeePersonal], professionalE: [EmployeeProfessional], department: String) {
    var listOfEmployees: [String] = []
    for item in zip(personalE, professionalE) where (department == item.1.dept) {
    listOfEmployees.append(item.1.name)
    }
for name in listOfEmployees {
    print("\(name) is in \(department)")
    }
    print("\n")
}

var argDepartment = "iOS"
employeeListDept(personalE: personalEmployees, professionalE: professionalEmployees, department: argDepartment)



//Question 4

func employeeListCountryBranch(personalE: [EmployeePersonal], professionalE: [EmployeeProfessional], country: String, branch: String) {
    var listOfEmployees: [String] = []
    for item in zip(personalE, professionalE) where ((branch == item.1.branch) && (country == item.0.country)){
    listOfEmployees.append(item.1.name)
    }
for name in listOfEmployees {
    print("\(name) is in \(branch) from \(country)")
    }
    print("\n")
}

var argBranch = "India"
argCountry = "India"
employeeListCountryBranch(personalE: personalEmployees, professionalE: professionalEmployees, country: argCountry, branch: argBranch)

//Question 5

func employeeListHobbyExp(personalE: [EmployeePersonal], professionalE: [EmployeeProfessional]) {
    var listOfEmployees = [String: Int]()
    for item in zip(personalE, professionalE) {
        if(item.0.hobbies != nil)
        {
            listOfEmployees[item.1.name] = item.1.exp
        }
    }
    dump(listOfEmployees)
    print("\n")
}
employeeListHobbyExp(personalE: personalEmployees, professionalE: professionalEmployees)

//Question 6

func employeeNameS(personalE: [EmployeePersonal]) -> [String] {
    var listOfEmployees: [String] = []
    for item in personalE {
        if(item.name[item.name.startIndex] == "S") {
            listOfEmployees.append(item.name)
        }
    }
    return listOfEmployees
}

print(employeeNameS(personalE: personalEmployees))
