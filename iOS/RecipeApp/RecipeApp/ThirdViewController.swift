//
//  ThirdViewController.swift
//  RecipeApp
//
//  Created by TTN on 07/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

let notificationIdentifier = "notificatnotificationIdentifierionId"

class ThirdViewController: UIViewController{
  
    var favoriteList =  [String?]()
    var tempList = [Int]()
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTableView.dataSource = self
        favoriteTableView.delegate = self
        NotificationCenter.default.addObserver(self,selector: #selector(doSomethingAfterNotified(notification:)),name: NSNotification.Name(rawValue: notificationIdentifier), object: nil)
        }
    
    @objc func doSomethingAfterNotified (notification: NSNotification) -> () {
        

         favoriteList = notification.object as! [String?]
//        print("\(favoriteList[0] ?? "hello")")
        favoriteTableView.reloadData()
    }
    
    

}


extension ThirdViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(favoriteList.count)
        return favoriteList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = favoriteList[indexPath.row]
        return cell
    }


}
