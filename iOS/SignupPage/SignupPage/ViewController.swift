//
//  ViewController.swift
//  SignupPage
//
//  Created by TTN on 01/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "SIGN UP"
    }

    @IBAction func signUpButtonTapped() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let firstVC = storyboard.instantiateViewController(withIdentifier: "FirstViewController") 
        
        navigationController?.pushViewController(firstVC, animated: true)
    }
    
    
    

}
