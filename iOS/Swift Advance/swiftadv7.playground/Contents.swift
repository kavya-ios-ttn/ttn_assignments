import UIKit

//let nameArr: [String?] = ["Ross", "Rachel", "Phoebe"]
//let validNames = nameArr.map{$0}
//print(validNames)

let people: [String?] = ["Ross", nil, "Rachel", nil, "Phoebe"]
let validPeople = people.compactMap{$0}
print(validPeople)



