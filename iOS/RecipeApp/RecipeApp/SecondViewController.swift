//
//  SecondViewController.swift
//  RecipeApp
//
//  Created by TTN on 07/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recipes = [Recipe]()
    var recipeDict = [Int:Bool]()
    var favList = [String?]()
    
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var recipeNameField: UITextField!
    @IBOutlet weak var durationField: UITextField!
    @IBOutlet weak var recipeTypeField: UITextField!
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        myTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        myTableView.delegate = self
        myTableView.dataSource = self
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        loadData()
    }
    
    func loadData(){
        let recipeRequest:NSFetchRequest<Recipe> = Recipe.fetchRequest()
        do {
            recipes = try managedObjectContext.fetch(recipeRequest)
            self.myTableView.reloadData()
        }catch {
            print("Could not load data from database \(error.localizedDescription )")
        }
    }

@IBAction func addRecipeButtonTapped(_ sender: Any) {
    
    let recipeItem = Recipe(context: managedObjectContext)
    recipeItem.name = recipeNameField!.text
    recipeItem.duration = durationField!.text
    recipeItem.type = recipeTypeField!.text
    
    do {
        try self .managedObjectContext.save()
        self.loadData()
    }catch {
        print("Could not save data \(error.localizedDescription)")
    }
}
    @IBAction func removeRecipeButtonTapped(_ sender: Any) {
        
        //Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        
        //Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try managedObjectContext.execute(batchDeleteRequest)
            myTableView.reloadData()
        } catch {
            print("Not able to delete data \(error.localizedDescription)")
        }
        
        
    }


@IBAction func logoutButtonTapped(_ sender: Any) {
    UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
    
    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipes.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = myTableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
    if recipeDict[indexPath.row] == true{
        cell.cellImage.image = UIImage(named: "filledheart")
        cell.configureCustomCell(element: recipes[indexPath.row] )
    } else {
        cell.cellImage.image = UIImage(named: "heart")
        cell.configureCustomCell(element: recipes[indexPath.row] )
    }
    return cell
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = myTableView.cellForRow(at: indexPath) as! CustomTableViewCell
    cell.cellImage.image = UIImage(named: "filledheart")
    favList.append(cell.nameLabel!.text)
//    print("fav list = \(favList)")
    NotificationCenter.default.post(name: Notification.Name(rawValue: notificationIdentifier), object: favList)
    
}

func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    let cell = myTableView.cellForRow(at: indexPath) as! CustomTableViewCell
    cell.cellImage.image = UIImage(named: "heart")
    recipeDict[indexPath.row] = false
}

}




