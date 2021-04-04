//
//  SecondViewController.swift
//  NotificationDemo
//
//  Created by TTN on 04/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

let notificationIdentifier = "notificatnotificationIdentifierionId"


class SecondViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second VC"
       NotificationCenter.default.addObserver(self,selector: #selector(doSomethingAfterNotified),name: NSNotification.Name(rawValue: notificationIdentifier), object: nil)
        
    }

    @objc func doSomethingAfterNotified () -> () {
        
        self.view.backgroundColor = UIColor.systemTeal
        labelTitle!.text = "Notified!"
    }
    
    @IBAction func buttonNextTapped(_ sender: Any) {
        
        let vc: ThirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    deinit{
       
         NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notificationIdentifier), object: nil)

     }

}
