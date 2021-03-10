//
//  GalleryViewController.swift
//  galleryApp
//
//  Created by TTN on 09/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//


import UIKit

class GalleryViewController: UIViewController {
  lazy var cardView1: CardView = {
    let cardView = CardView(with: .skeleton)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    return cardView
  }()
  
  lazy var cardView2: CardView = {
    let cardView = CardView(with: .owl)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    return cardView
  }()
  
  lazy var cardView3: CardView = {
    let cardView = CardView(with: .panda)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    return cardView
  }()
  
  lazy var cardView4: CardView = {
    let cardView = CardView(with: .monkey)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    return cardView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
    view.backgroundColor = .white
  }
  

    private func setupViews() {
        view.addSubviews(cardView1, cardView2, cardView3, cardView4)
    }
    
  // MARK: - Setting Constraints
  private func setupConstraints() {
    let safeArea = view.safeAreaLayoutGuide

    NSLayoutConstraint.activate([
      cardView1.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
      cardView1.topAnchor.constraint(equalTo: safeArea.topAnchor),
      cardView1.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
      cardView1.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),

      cardView2.leadingAnchor.constraint(equalTo: cardView1.trailingAnchor),
      cardView2.topAnchor.constraint(equalTo: safeArea.topAnchor),
      cardView2.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
      cardView2.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
      cardView2.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),

      cardView3.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
      cardView3.topAnchor.constraint(equalTo: cardView1.bottomAnchor),
      cardView3.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
      cardView3.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
      cardView3.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),

      cardView4.leadingAnchor.constraint(equalTo: cardView3.trailingAnchor),
      cardView4.topAnchor.constraint(equalTo: cardView2.bottomAnchor),
      cardView4.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
      cardView4.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
      cardView4.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
    ])
  }
}

