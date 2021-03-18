//
//  ViewController.swift
//  Auto_layout_stack
//
//  Created by TTN on 18/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func valueEntered(_ sender: Any) {
        
        let string = txtField.text
        if (string == "1"){
            
            let vc = storyboard?.instantiateViewController(identifier: "First") as! SingleStackViewController
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
            
        } else if (string == "2"){
            
            let vc = storyboard?.instantiateViewController(identifier: "Second") as! SingleStackDualVieController
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
            
        } else if (string == "3"){
            
            let vc = storyboard?.instantiateViewController(identifier: "Third") as! SingleStackTriViewController
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
            
        } else if (string == "4"){
            
            let vc = storyboard?.instantiateViewController(identifier: "Fourth") as! DoubleStackViewController
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }


}

