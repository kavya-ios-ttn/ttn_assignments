//
//  SceneDelegate.swift
//  galleryApp
//
//  Created by TTN on 09/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }
    //1
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    //2
    window?.windowScene = windowScene
    //3
    window?.rootViewController = GalleryViewController()
    //4
    window?.makeKeyAndVisible()
  }
}


