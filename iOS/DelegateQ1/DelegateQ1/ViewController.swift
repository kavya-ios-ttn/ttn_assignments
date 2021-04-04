//
//  ViewController.swift
//  DelegateQ1
//
//  Created by TTN on 01/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

struct Model {
    var Name: String?
    var momName: String?
    var dadName: String?
    var age: String?
    
    
    init(Name: String?, momName: String?, dadName: String?, age: String?) {
        self.Name = Name
        self.momName = momName
        self.dadName = dadName
        self.age = age
        
    }
}

class ViewController: UIViewController {

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
        let vc = storyboard?.instantiateViewController(identifier: "First") as! FirstViewController
        self.present(vc, animated: true, completion: nil)
        vc.delegate = self
    }
}

extension ViewController: FirstDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func valueToBeReceived(_ data: [String: String?]) {
        let model = Model(Name: data["Name"] ?? "", momName: data["Mother's Name"] ?? "", dadName: data["Father's Name"] ?? "", age: data["Age"] ?? "")
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

