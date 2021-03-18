//
//  GalleryView.swift
//  GalleryAppDemo
//
//  Created by TTN on 18/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit


final class GalleryView: UIView {
 
  
    var imageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    image.backgroundColor = .white
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
    var textLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  public convenience init(with type: imageType) {
    self.init(frame: .zero)
    configureApp(with: type)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    //add code here to add views to hierarchy
    addSubviews(imageView, textLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
    ])
    
    NSLayoutConstraint.activate([
      textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
      textLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
      textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
      textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
    ])
    
    textLabel.setContentHuggingPriority(.init(rawValue: 252), for: .vertical)
    textLabel.setContentCompressionResistancePriority(.init(rawValue: 751), for: .vertical)
  }
}

extension GalleryView {
  public func configureApp(with type: imageType) {
    let model = galleryModel.getDetails(for: type)
    imageView.image = UIImage(named: model.imageName)
    textLabel.text = model.characterName
    backgroundColor = model.backgroundColor
  }
}

