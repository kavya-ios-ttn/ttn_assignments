import UIKit

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐓", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
let commonSet = houseAnimals.union(farmAnimals).union(cityAnimals)
print(commonSet)


print(farmAnimals.union(houseAnimals))

print(farmAnimals.isDisjoint(with: cityAnimals))

print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))

