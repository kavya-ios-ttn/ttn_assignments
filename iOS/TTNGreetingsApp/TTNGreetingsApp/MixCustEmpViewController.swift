//
//  MixCustEmpViewController.swift
//  TTNGreetingsApp
//
//  Created by TTN on 31/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit


struct Data {
    var name: String
    var ID: String
    var emailID: String
    var phoneNum: String
    
    init(name: String, ID: String, emailID: String, phoneNum: String) {
        self.name = name
        self.ID = ID
        self.emailID = emailID
        self.phoneNum = phoneNum
    }
}

class MixCustEmpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var username: String = ""
    var emailID: String = ""
    var phoneNum: String = ""
    var ID: String = ""
    var userDP: String = ""
    
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var loggedUserDP: UIImageView!
    
    var model: Model = Model()
       var empList: [Employee] {
           return model.emp
       }
       
    var customerList: [Customer] {
           return model.cust
       }
    
    var general: [Data] = []
    //DP
    
    func convertData() {
        
        for i in 0..<empList.count {
            general.append(Data(name: empList[i].fname, ID: empList[i].employeeID, emailID: empList[i].emailID, phoneNum: empList[i].phoneNum))
        }
        for i in 0..<customerList.count {
            general.append(Data(name: customerList[i].name, ID: customerList[i].ID, emailID: customerList[i].emailID, phoneNum: customerList[i].phoneNum))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        convertData()
        
        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
        
        myTableView.register(nib, forCellReuseIdentifier: "MyTableViewCell")
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.reloadData()
        myTableView.layoutIfNeeded()
        IDLabel.text = ID
        nameLabel.text = username
        emailLabel.text = emailID
        contactLabel.text = phoneNum

        let img = UIImage(named: userDP)
        
        loggedUserDP.image = img
    
    }
    
    override func viewDidLayoutSubviews() {
            myTableView.heightAnchor.constraint(equalToConstant:
            myTableView.contentSize.height).isActive = true
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return general.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = myTableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
            cell.transferData(element: general[indexPath.row])
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 90.0
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.showToast(msg: "Greetings to \(general[indexPath.row].name) from \(username)", font: .systemFont(ofSize: 12.0))
        }

    }


