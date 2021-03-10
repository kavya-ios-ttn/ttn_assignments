import UIKit

var str = "Hello, playgroundimport Foundation"
 let myString = "abc"
 var input:String = myString
 var position: String.Index = input.startIndex

func advance() {
     assert(position < myString.endIndex, "Cannot advance past endIndex!")
     position = myString.index(after: position)
 }
 advance()
 position
 advance()
 position
 advance()
 position
 advance() //trap

