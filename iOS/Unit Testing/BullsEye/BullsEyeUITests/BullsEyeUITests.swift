/// Copyright (c) 2021 Razeware LLC
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

import XCTest

class BullsEyeUITests: XCTestCase {
  
  var application: XCUIApplication!


    override func setUpWithError() throws {
        continueAfterFailure = false
      
        application = XCUIApplication()
        application.launch()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGameStyleSwitch() throws {
        // UI tests must launch the application that they test.
    
      let slideBtn = application.segmentedControls.buttons["Slide"]
      let typeBtn = application.segmentedControls.buttons["Type"]
      let slideLbl = application.staticTexts["Get as close as you can to: "]
      let typeLbl = application.staticTexts["Guess where the slider is: "]
        
      
      if slideBtn.isSelected {
        XCTAssertTrue(slideLbl.exists)
        XCTAssertFalse(typeLbl.exists)

        typeBtn.tap()
        XCTAssertTrue(typeLbl.exists)
        XCTAssertFalse(slideLbl.exists)
      } else if typeBtn.isSelected {
        XCTAssertTrue(typeLbl.exists)
        XCTAssertFalse(slideLbl.exists)

        slideBtn.tap()
        XCTAssertTrue(slideLbl.exists)
        XCTAssertFalse(typeLbl.exists)
      }

      
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
