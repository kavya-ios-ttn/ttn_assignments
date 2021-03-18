//
//  GalleryAppViewController.swift
//  GalleryAppDemo
//
//  Created by TTN on 18/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class GalleryAppViewController: UIViewController {
    
    var v1: GalleryView = {
        let view = GalleryView(with: .monkey)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var v2: GalleryView = {
        let view = GalleryView(with: .panda)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var v3: GalleryView = {
      let view = GalleryView(with: .owl)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    var v4: GalleryView = {
      let view = GalleryView(with: .skeleton)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        view.backgroundColor = .white
       
    }
    
    private func setupViews() {
        view.addSubviews(v1, v2, v3, v4)
    }
    
    private func setupConstraints() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([v1.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
              v1.topAnchor.constraint(equalTo: safeArea.topAnchor),
              v1.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
              v1.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),

              v2.leadingAnchor.constraint(equalTo: v1.trailingAnchor),
              v2.topAnchor.constraint(equalTo: safeArea.topAnchor),
              v2.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
              v2.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
              v2.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),

              v3.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
              v3.topAnchor.constraint(equalTo: v1.bottomAnchor),
              v3.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
              v3.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
              v3.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),

              v4.leadingAnchor.constraint(equalTo: v3.trailingAnchor),
              v4.topAnchor.constraint(equalTo: v2.bottomAnchor),
              v4.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
              v4.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
              v4.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            ])
          }
}

public extension UIView {
  func addSubviews(_ views: UIView...) {
    for view in views {
      addSubview(view)
    }
  }
}
    
