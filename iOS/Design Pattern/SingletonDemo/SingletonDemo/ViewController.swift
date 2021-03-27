//
//  ViewController.swift
//  SingletonDemo
//
//  Created by TTN on 28/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit


public struct personModel {
    public var Name: String?
    public var Email: String?
    public var Address: String?
    public var zipCode: String?
}

var objArray = [personModel(Name: "Ross", Email: "ross@gmail.com", Address: "New York", zipCode: "101"),
                personModel(Name: "Rachel", Email: "rach@gmail.com", Address: "Paris", zipCode: "102"),
                personModel(Name: "Chandler", Email: "chan@gmail.com", Address: "Yemen", zipCode: "103"),
                personModel(Name: "Monica", Email: "mon@gmail.com", Address: "New York", zipCode: "104"),
                personModel(Name: "Joey", Email: "joe@gmail.com", Address: "Italy", zipCode: "105"),
                personModel(Name: "Phoebe", Email: "pheebs@gmail.com", Address: "Africa", zipCode: "106"),
                personModel(Name: "Tim", Email: "tim@gmail.com", Address: "India", zipCode: "107"),
                personModel(Name: "Zubaid", Email: "zu@gmail.com", Address: "UAE", zipCode: "108"),
                personModel(Name: "Putin", Email: "putin@gmail.com", Address: "Russia", zipCode: "109"),
                personModel(Name: "Robert", Email: "rdj@gmail.com", Address: "Australia", zipCode: "110")
]

class person {
    static let shared = person()
    
    private init() {}
    
    var objPerson: [personModel] = objArray
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToFirstVC(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "First") as! FirstViewController
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func goToSecondVC(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "Second") as! SecondViewController
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func goToThirdtVC(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "Third") as! ThirdViewController
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }



}

