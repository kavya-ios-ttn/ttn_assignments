//
//  ViewController.swift
//  CocoaPods
//
//  Created by TTN on 22/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var cocoa = [Stats]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        downloadJSON {
            self.tableView.reloadData()        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocoa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = cocoa[indexPath.row].author.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController {
            destination.cc = cocoa[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
    func downloadJSON(completed: @escaping () -> ()) {
        
        let url = URL(string: "https://picsum.photos/v2/list")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                    self.cocoa = try JSONDecoder().decode([Stats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                    
            }catch {
                print("JSON Error")
            }
        }
        }.resume()

}

}
