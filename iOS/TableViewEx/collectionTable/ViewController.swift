//
//  ViewController.swift
//  collectionTable
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTable : UITableView!
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        models.append(Model(text: "Action", imageName: "1"))
        models.append(Model(text: "Drama", imageName: "2"))
        models.append(Model(text: "Science Fiction", imageName: "3"))
        models.append(Model(text: "Kids", imageName: "4"))
        models.append(Model(text: "Horror", imageName: "5"))
        models.append(Model(text: "Romantic Comedy", imageName: "6"))
        models.append(Model(text: "Teen Romance", imageName: "7"))
        
        myTable.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        myTable.delegate = self
        myTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.configure(with: models)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }

}

struct Model{
    let text : String
    let imageName : String
    
    init(text:String,imageName:String) {
        self.text = text
        self.imageName = imageName
    }
    
}
