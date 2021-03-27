//
//  SecondViewController.swift
//  SingletonDemo
//
//  Created by TTN on 28/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
   
    var objArrayVC2 = person.shared.objPerson
    

    
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           myTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
           myTableView.delegate = self
           myTableView.dataSource = self
       }
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return objArrayVC2.count
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

           
           let cell = myTableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
           
           cell.configureMyFunction2(element: objArrayVC2[indexPath.row])
           return cell
         }

}

