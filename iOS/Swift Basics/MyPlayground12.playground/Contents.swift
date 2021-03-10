import UIKit

let greeting = "I was thinking of going to to the new. The work is from home."

let endOfSentence = greeting.firstIndex(of: ".")!
let firstSentence = greeting[...endOfSentence]

if endOfSentence == greeting.firstIndex(of: ".")! && firstSentence == greeting[...endOfSentence] {
    print("true")
}
else{
    print("false")
}


