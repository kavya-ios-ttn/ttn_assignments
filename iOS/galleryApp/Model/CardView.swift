//
//  CardView.swift
//  galleryApp
//
//  Created by TTN on 09/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

final class CardView: UIView {
  private let padding: CGFloat = 16
  
  private lazy var imageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    image.backgroundColor = .white
    image.layer.cornerRadius = 8
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  private lazy var textLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  public convenience init(with type: CardType) {
    self.init(frame: .zero)
    configureCard(with: type)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    addSubviews(imageView, textLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
    ])
    
    NSLayoutConstraint.activate([
      textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
      textLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
      textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
      textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
    ])
    
    textLabel.setContentHuggingPriority(.init(rawValue: 252), for: .vertical)
    textLabel.setContentCompressionResistancePriority(.init(rawValue: 751), for: .vertical)
  }
}

// MARK: - View Configuration
extension CardView {
  public func configureCard(with type: CardType) {
    let model = CardModel.getCardDetails(for: type)
    imageView.image = UIImage(named: model.imageName)
    textLabel.text = model.characterName
    backgroundColor = model.backgroundColor
  }
}


