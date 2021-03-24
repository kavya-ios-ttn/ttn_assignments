/// Copyright (c) 2018 Razeware LLC
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

import UIKit

struct PhotoManagerNotification {
  // Notification when new photo instances are added
  static let contentAdded = Notification.Name("com.raywenderlich.GooglyPuff.PhotoManagerContentAdded")
  // Notification when content updates (i.e. Download finishes)
  static let contentUpdated = Notification.Name("com.raywenderlich.GooglyPuff.PhotoManagerContentUpdated")
}

struct PhotoURLString {
  // Photo Credit: Devin Begley, http://www.devinbegley.com/
  static let overlyAttachedGirlfriend = "https://i.imgur.com/zMRy3Ed.jpeg"
  static let successKid = "https://i.imgur.com/Z87EoDW.jpg"
  static let lotsOfFaces = "https://i.imgur.com/rGdGk6d.jpeg"
}

typealias PhotoProcessingProgressClosure = (_ completionPercentage: CGFloat) -> Void
typealias BatchPhotoDownloadingCompletionClosure = (_ error: NSError?) -> Void

final class PhotoManager {
  private init() {}
  static let shared = PhotoManager()
    
    // ** MODIFICATION 3 **
  private let concurrentPhotoQueue = DispatchQueue(label: "com.raywenderlich.GooglyPuff.photoQueue",attributes: .concurrent)
    // modification 3 ends
  private var unsafePhotos: [Photo] = []
  
  var photos: [Photo] {
    // ** MODIFICATION 5 **
    //return unsafePhotos
    var photosCopy: [Photo]!

    // 1 . we are reading photos synchronously 
    concurrentPhotoQueue.sync {

      // 2 . storing the photos in photoarray and returniing it
      photosCopy = self.unsafePhotos
    }
    return photosCopy
    // MODIFICATION 5 ENDS
  }
  
  func addPhoto(_ photo: Photo) {
    // ** MODIFICATION 4 **
//    unsafePhotos.append(photo)
//    DispatchQueue.main.async { [weak self] in
//      self?.postContentAddedNotification()
//    }
    // 1 .  we use barrie in async ( to haev only one item in our queue we used it ).
    concurrentPhotoQueue.async(flags: .barrier) { [weak self] in
      
      guard let self = self else {
        return
      }

      // 2 . we added photo ( object ) to the array
      self.unsafePhotos.append(photo)

      // 3 . we post the UI notification and we have to do it asynchrounously in the main queue
      DispatchQueue.main.async { [weak self] in
        self?.postContentAddedNotification()
      }
    }
    // MODIFICATION 4 ENDS
  }
  
  func downloadPhotos(withCompletion completion: BatchPhotoDownloadingCompletionClosure?) {
    var storedError: NSError?
    for address in [PhotoURLString.overlyAttachedGirlfriend,
                    PhotoURLString.successKid,
                    PhotoURLString.lotsOfFaces] {
                      let url = URL(string: address)
                      let photo = DownloadPhoto(url: url!) { _, error in
                        if error != nil {
                          storedError = error
                        }
                      }
                      PhotoManager.shared.addPhoto(photo)
    }
    
    completion?(storedError)
  }
  
  private func postContentAddedNotification() {
    NotificationCenter.default.post(name: PhotoManagerNotification.contentAdded, object: nil)
  }
}
