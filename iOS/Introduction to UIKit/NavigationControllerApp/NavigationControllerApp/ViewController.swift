//
//  ViewController.swift
//  NavigationControllerApp
//
//  Created by TTN on 14/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit


protocol DataDelegate: class {
    func valueToBeSent(_ string: String)
}

class ViewController: UIViewController {
    
    weak var delegate: DataDelegate?
    
    @IBOutlet var field: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
        
    @IBAction func didTapButton() {
        let vc = storyboard?.instantiateViewController(identifier: "Second") as! SecondViewController
        
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func presentOnFinalScreen(_ sender: Any) {
        
        let string = field.text ?? "Nope"
               
               delegate?.valueToBeSent(string)
               
               navigationController?.popViewController(animated: true)
               dismiss(animated: true, completion: nil)
           }
    
}

