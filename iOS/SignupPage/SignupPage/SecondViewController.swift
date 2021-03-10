//
//  SecondViewController.swift
//  SignupPage
//
//  Created by TTN on 01/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "SEGMENT CONTROL"
    }

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
            {
            case 0:
                textLabel.text = "Employer Segment Selected"
            case 1:
                textLabel.text = "Employee Segment Selected"
            default:
                break
            }
    }
}
