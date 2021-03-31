//
//  MyTableViewCell.swift
//  TTNGreetingsApp
//
//  Created by TTN on 31/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func showToast(msg: String, font: UIFont) {
         let toastLabel = UILabel(frame: CGRect(x: self.contentView.frame.size.width/2 - 75, y: self.contentView.frame.size.height-100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = font
            toastLabel.textAlignment = .center;
            toastLabel.text = msg
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.contentView.addSubview(toastLabel)
            UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
    }
}

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func transferData(element: Data) {
        IDLabel.text = String(element.ID)
        nameLabel.text = element.name
        emailLabel.text = element.emailID
        phoneNumLabel.text = String(element.phoneNum)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
