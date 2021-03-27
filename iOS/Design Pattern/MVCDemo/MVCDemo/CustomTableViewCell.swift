//
//  CustomTableViewCell.swift
//  MVCDemo
//
//  Created by TTN on 28/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureMyFunction(element: person) {
        
        nameLabel.text = element.Name
        emailLabel.text = element.Email
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
