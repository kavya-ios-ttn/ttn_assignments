import UIKit

class Product {
let name: String
init?(name: String) {
if name.isEmpty { return nil }
self.name = name
}
}
class CartItem: Product {
let quantity: Int
init?(name: String, quantity: Int) {
if quantity < 1 { return nil }
self.quantity = quantity
super.init(name: name)
}
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) { // fails
print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
print("Unable to initialize zero shirts")
}
// Prints "Unable to initialize zero shirts"

if let oneUnnamed = CartItem(name: "", quantity: 1) { // fails
print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
print("Unable to initialize one unnamed product")
}
// Prints "Unable to initialize one unnamed product"
