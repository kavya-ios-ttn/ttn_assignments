/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

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
