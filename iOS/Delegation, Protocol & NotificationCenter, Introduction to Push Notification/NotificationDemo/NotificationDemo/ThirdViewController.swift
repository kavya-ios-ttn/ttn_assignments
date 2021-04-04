//
//  ThirdViewController.swift
//  NotificationDemo
//
//  Created by TTN on 04/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

     override func viewDidLoad() {
            super.viewDidLoad()

           self.title = "Third VC"
            
        }
       
        @IBAction func buttonClickToNotifyTapped(_ sender: Any) {
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: notificationIdentifier), object: self)
        }
        
    }

