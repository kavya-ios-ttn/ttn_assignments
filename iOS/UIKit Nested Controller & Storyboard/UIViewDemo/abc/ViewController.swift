//
//  ViewController.swift
//  abc
//
//  Created by TTN on 17/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var view2 : UIView!
    @IBOutlet weak var hogwarts : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hogwarts.text = "Mischief Managed"
        view2.layer.cornerRadius = 10.0
        view2.layer.shadowColor = UIColor.init(white: 220.0/255.0, alpha: 5.0).cgColor
        view2.layer.shadowOpacity = 1.0
        view2.layer.shadowRadius = 10.0
        view2.layer.shadowOffset = CGSize(width: -10, height: 10)
        
    }



}

