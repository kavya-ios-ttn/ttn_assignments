//
//  FirstViewController.swift
//  DelegateQ1
//
//  Created by TTN on 02/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

protocol FirstDelegate: class {
    func valueToBeReceived(_ data: [String: String?])
}

class FirstViewController: UIViewController {

    
        
        weak var delegate: FirstDelegate?
        
        @IBOutlet weak var nameField: UITextField!
        @IBOutlet weak var motherField: UITextField!
        @IBOutlet weak var fatherField: UITextField!
        @IBOutlet weak var ageField: UITextField!
        
        var data: [String: String?] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
        
        @IBAction func postButtonTapped(_ sender: Any) {
           
               let data1: String? = nameField!.text
               let data2: String? = motherField!.text
               let data3: String? = fatherField!.text
               let data4: String? = ageField!.text
               
               
            data = ["name":data1,"mother's name":data2,"father's name":data3, "age":data4]

               dismiss(animated: true) {
                   self.delegate?.valueToBeReceived(self.data)
               }
           
           }

    

    

}

