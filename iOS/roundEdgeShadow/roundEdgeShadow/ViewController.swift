//
//  ViewController.swift
//  roundEdgeShadow
//
//  Created by TTN on 08/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vwContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vwContainer.layer.shadowColor = UIColor.blue.cgColor
        vwContainer.layer.shadowOffset = .zero
        vwContainer.layer.shadowOpacity = 0.6
        vwContainer.layer.shadowRadius = 10.0
        vwContainer.layer.shadowPath = UIBezierPath(rect: vwContainer.bounds).cgPath
        vwContainer.layer.shouldRasterize = true
        
    }
    
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
     
    }
}


