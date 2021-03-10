//
//  ViewController.swift
//  Bootcamp
//
//  Created by TTN on 24/02/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.setTitle("LOGIN", for: .normal)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    
    //      @IBAction func loginButtonTapped() {
    //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //            let vc = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
    //            // self.present(vc, animated: true)
    //            self.present(vc, animated: true, completion: nil)
    //            navigationController?.pushViewController(vc, animated: true)
    //
    //        }
    //
    
    @IBAction func presentScreenMethod() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
            as! FirstViewController
        
        vc.nameLabel = "Signout"
        
        // self.present(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
        //navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func pushScreenMethod() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
            as! SecondViewController
        vc.subNameLabel = "Signout"
        // self.present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}


