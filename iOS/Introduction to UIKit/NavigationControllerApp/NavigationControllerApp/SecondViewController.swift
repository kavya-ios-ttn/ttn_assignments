//
//  SecondViewController.swift
//  NavigationControllerApp
//
//  Created by TTN on 14/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Second Page"
    }
    
    @IBAction func didTapButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func moveForward(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
        
        vc.navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.pushViewController(vc, animated: true)
    }


}
