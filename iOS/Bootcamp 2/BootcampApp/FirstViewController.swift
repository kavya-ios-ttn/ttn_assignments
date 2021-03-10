//
//  FirstViewController.swift
//  Bootcamp
//
//  Created by TTN on 24/02/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var nameLabel: String!
    
    @IBOutlet weak var loginButton2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loginButton2.setTitle("Move forward", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        
        self.present(vc, animated: true, completion: nil)
        // self.present(vc, animated: true)
        //navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dismissButton() {
        self.dismiss(animated: true, completion: nil)
    }
}



        
