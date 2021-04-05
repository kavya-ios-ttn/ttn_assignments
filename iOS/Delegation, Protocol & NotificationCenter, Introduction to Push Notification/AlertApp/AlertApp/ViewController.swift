//
//  ViewController.swift
//  AlertApp
//
//  Created by TTN on 05/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let center = UNUserNotificationCenter.current()
             
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in }
             
            
        let content = UNMutableNotificationContent()
        content.title = "You have 3 notifications!"
        content.body = "Myntra sale - flat upto 20%"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "actionCategory"
        content.badge = 3
        
        let viewAction = UNNotificationAction(identifier: "view",
            title:"View",options:[])

        let category = UNNotificationCategory(identifier: "actionCategory",
             actions: [viewAction],
            intentIdentifiers: [], options: [])

        UNUserNotificationCenter.current().setNotificationCategories([category])
             
        let date = Date().addingTimeInterval(5)
             
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
             
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
             
        let uuidString = UUID().uuidString
             
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
             
             
        center.add(request) { (error) in }
        
    }

}

