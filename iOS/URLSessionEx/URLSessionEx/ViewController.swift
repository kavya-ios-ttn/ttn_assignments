//
//  ViewController.swift
//  URLSessionEx
//
//  Created by TTN on 10/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func getButton(_ sender: Any) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/")!
        
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("error: \(error!)")
                return
            }
            
            guard let content = data else {
                print("No data")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [[String: Any]]
                else {
                print("Does not contain JSON")
                return
            }
            print("JSON response dictionary is in \n \(json)")
        }
        task.resume()
    }
    
    //POST
    
    @IBAction func postButton(_ sender: Any) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let postDictionary : [String: Any] = ["postId": 10, "name": "Kavya Casshyap", "email": "kavya.casshyap@tothenew.com", "id": 10, "body": "Trying out POST Method of URLSession"]
        
        guard let postData = try?
            JSONSerialization.data(withJSONObject: postDictionary, options: []) else {
                return
        }
        
        urlRequest.httpBody = postData
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                print("error: \(error!)")
                return
            }
            
            guard let content = data else {
                print("No data")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Does not contain JSON")
                return
            }
            print("JSON response dictionary is in \n \(json)")
        }
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

