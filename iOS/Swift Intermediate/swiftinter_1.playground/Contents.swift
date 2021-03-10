import UIKit

func siftBeans(fromGroceryList list:[String]) ->(beans:[String], otherGroceries: [String]) {
    return (
        list.filter { $0.hasSuffix("beans")},
        list.filter { !$0.hasSuffix("beans")}
    )
}
let result = siftBeans(fromGroceryList: ["green beans",
"milk",
"black beans",
"pinto beans",
"apples"])

result.beans == ["green beans", "black beans", "pinto beans"]

result.otherGroceries == ["milk", "apples"]
