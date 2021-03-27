//
//  ViewController.swift
//  MVCDemo
//
//  Created by TTN on 27/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

public struct person {
    public var Name: String
    public var Email: String
    public var Address: String
    public var zipCode: String
}

var objArray = [person(Name: "Ross", Email: "ross@gmail.com", Address: "New York", zipCode: "101"),
                person(Name: "Rachel", Email: "rach@gmail.com", Address: "Paris", zipCode: "102"),
                person(Name: "Chandler", Email: "chan@gmail.com", Address: "Yemen", zipCode: "103"),
                person(Name: "Monica", Email: "mon@gmail.com", Address: "New York", zipCode: "104"),
                person(Name: "Joey", Email: "joe@gmail.com", Address: "Italy", zipCode: "105"),
                person(Name: "Phoebe", Email: "pheebs@gmail.com", Address: "Africa", zipCode: "106"),
                person(Name: "Tim", Email: "tim@gmail.com", Address: "India", zipCode: "107"),
                person(Name: "Zubaid", Email: "zu@gmail.com", Address: "UAE", zipCode: "108"),
                person(Name: "Putin", Email: "putin@gmail.com", Address: "Russia", zipCode: "109"),
                person(Name: "Robert", Email: "rdj@gmail.com", Address: "Australia", zipCode: "110")
]





class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         myTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        cell.configureMyFunction(element: objArray[indexPath.row])
        return cell
    }

}

