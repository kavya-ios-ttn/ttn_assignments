import UIKit

let values: [Int] = [10, 15, 20, 25, 30]
let sum = values.reduce(1000, {$0 + $1})
print(sum)

