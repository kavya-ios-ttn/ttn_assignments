//
//  CustomTableViewCell.swift
//  RecipeApp
//
//  Created by TTN on 08/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    
    static let identifier = "CustomTableViewCell"
    
    static func nib() -> UINib {
        
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCustomCell(element: Recipe){
        nameLabel!.text = element.name
        durationLabel!.text = element.duration
        typeLabel!.text = element.type
    }
    

    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
}
