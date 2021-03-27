//
//  CustomTableViewCell.swift
//  SingletonDemo
//
//  Created by TTN on 28/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    static let identifier = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureMyFunction1(element: personModel) {
        nameLabel.text = element.Name
        tempLabel.text = element.Email
    }
    
    func configureMyFunction2(element: personModel) {
        nameLabel.text = element.Name
        tempLabel.text = element.Address
    }
    
    func configureMyFunction3(element: personModel) {
        nameLabel.text = element.Name
        tempLabel.text = element.zipCode
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
