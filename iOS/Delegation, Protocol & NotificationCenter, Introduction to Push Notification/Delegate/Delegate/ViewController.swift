//
//  ViewController.swift
//  Delegate
//
//  Created by TTN on 25/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

struct Model {
    var name: String?
    var momName: String?
    var dadName: String?
    var age: String?
    
    init(name: String?, motherName: String?, fatherName: String?, age: String?) {
        self.name = name
        self.momName = motherName
        self.dadName = fatherName
        self.age = age
    }
}

class ViewController: UIViewController{

    
    @IBOutlet weak var myTableView: UITableView!
    
    var recievedData: [String:String?] = [:]
    var dictValues: [Model] = []
    var myString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.title = "Information"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(insert))
        myTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
            myTableView.delegate = self
            myTableView.dataSource = self
    }
    @objc func insert() {
        let vc = storyboard?.instantiateViewController(identifier: "first") as! FirstViewController
        self.present(vc, animated: true, completion: nil)
        vc.delegate = self

    }

    
    
}
extension ViewController: FirstDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func valuesToBeRecieved(_ data: [String : String?]) {
        
        let model = Model(name: data["name"] ?? "", motherName: data["mother's name"] ?? "", fatherName: data["father's name"] ?? "", age: data["age"] ?? "")
        dictValues.append(model)
        myTableView.reloadData()

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dictValues.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = myTableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell

        cell.configureMyFunction(element: dictValues[indexPath.row])
            return cell
    }
    
}


