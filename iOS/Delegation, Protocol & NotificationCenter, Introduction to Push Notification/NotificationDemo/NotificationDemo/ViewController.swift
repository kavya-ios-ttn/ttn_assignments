//
//  ViewController.swift
//  NotificationDemo
//
//  Created by TTN on 04/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "First VC"
        NotificationCenter.default.addObserver(self,selector: #selector(doSomethingAfterNotified),name: NSNotification.Name(rawValue: notificationIdentifier), object: nil)
        
        
    }
    
    @objc func doSomethingAfterNotified() {
        self.view.backgroundColor = UIColor.systemPink
        labelTitle!.text = "Notified!"
    }

    
    @IBAction func buttonNavigateToNextTapped(_ sender: Any) {
        
        let vc: SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    deinit{
          
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notificationIdentifier), object: nil)

        }
    
}


