//
//  CustomCollectionViewCell.swift
//  collectionTable
//
//  Created by harsh_TTN on 18/03/21.
//  Copyright © 2021 harsh_TTN. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myLabel : UILabel!
    @IBOutlet weak var myImageView : UIImageView!
    static let identifier = "CustomCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model : Model){
        myLabel.text = model.text
        myImageView.image = UIImage(named: model.imageName)
    }

}
