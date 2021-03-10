import UIKit

protocol Sound {
    func makeSound()
}
 
extension Sound {
    func makeSound() {
        print("Hello!")
    }
}

class trial: Sound {}
let t = trial()
t.makeSound()
 


