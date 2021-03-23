

import Foundation

class BullsEyeGame {
  var round_no = 0
  let startValue_score = 50
  var targetValue_score = 50
  var scoreRound_total = 0
  var scoreTotal_final = 0
  
  init() {
    startNewGame()
  }
  
  func startNewGame() {
    round_no = 0
    scoreTotal_final = 0
    startNewRound()
  }
  
  func startNewRound() {
    round_no = round_no + 1
    scoreRound_total = 0
    targetValue_score = 1 + (Int(arc4random()) % 100)
  }

  //The problem in check function  is that difference is negative, so the score is 100 – (-5).(Line no. 61)
  //Therefore we should use the absolute value of difference as used in line no. 60. So comment line 61 and uncomment line 60 and then run the test.
  
  @discardableResult
  func check(guess: Int) -> Int {
    
    let difference = abs(targetValue_score - guess)
//      let difference = guess - targetValue
    scoreRound_total = 100 - difference
    scoreTotal_final = scoreTotal_final + scoreRound_total
    
    return difference
  }
}
