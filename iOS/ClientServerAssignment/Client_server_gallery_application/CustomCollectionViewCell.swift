//
//  CustomCollectionViewCell.swift
//  Client_server_gallery_application
//
//  Created by TTN on 20/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImageView : UIImageView!
    static let identifier = "CustomCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with myObject : imagesDetails){
        
        let id : String = "\(myObject.id)"
        let urlString = "https://picsum.photos/200/300?image=" + id
        
        let url = URL(string: urlString)!
        myImageView.contentMode = .scaleAspectFill
        myImageView.downloadedFrom(url: url)
        
    }
    
}
