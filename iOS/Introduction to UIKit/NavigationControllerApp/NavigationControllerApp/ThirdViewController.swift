//
//  ThirdViewController.swift
//  NavigationControllerApp
//
//  Created by TTN on 14/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Third Page"
    }
    
    @IBAction func goToNextScreen(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "FourthViewController") as! FourthViewController
        
        vc.navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func popToRootVC(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
