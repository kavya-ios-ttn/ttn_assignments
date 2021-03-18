//
//  GalleryModel.swift
//  GalleryAppDemo
//
//  Created by TTN on 18/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

enum imageType: String {
  case skeleton = "skeleton"
  case monkey = "monkey"
  case owl = "owl"
  case panda = "panda"
  
  func associatedColor() -> UIColor {
    switch self {
    case .skeleton:
      return .blue
      
    case .monkey:
      return .green
      
    case .owl:
      return .red
      
    case .panda:
      return .yellow
    }
  }
}

class galleryModel {
  var imageName: String
  var characterName: String
  var backgroundColor: UIColor
  
  init(imageName: String, characterName: String, backgroundColor: UIColor) {
    self.imageName = imageName
    self.characterName = characterName
    self.backgroundColor = backgroundColor
  }
  
  public static func getDetails(for type: imageType) -> galleryModel {
    return galleryModel (
      imageName: type.rawValue,
      characterName: type.rawValue.capitalized,
      backgroundColor: type.associatedColor())
  }
}
