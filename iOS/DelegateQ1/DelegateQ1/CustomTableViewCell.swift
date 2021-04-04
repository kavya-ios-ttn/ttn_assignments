//
//  CustomTableViewCell.swift
//  DelegateQ1
//
//  Created by TTN on 03/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
     
    @IBOutlet weak var motherLabel: UILabel!
    
    @IBOutlet weak var fatherLabel: UILabel!
    
     
    @IBOutlet weak var ageLabel: UILabel!
    
    
     
     static let identifier = "CustomTableViewCell"
             
         static func nib() -> UINib{
             return UINib(nibName: "CustomTableViewCell", bundle: nil)
         }
     
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
     }

      func configureMyFunction(element: Model){

         nameLabel!.text = element.Name
         motherLabel!.text = element.momName
        fatherLabel!.text = element.dadName
         ageLabel!.text = element.age
         
         }
     
     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         // Configure the view for the selected state
     }
     

    
}
