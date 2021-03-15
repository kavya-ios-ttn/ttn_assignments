//
//  FourthViewController.swift
//  NavigationControllerApp
//
//  Created by TTN on 14/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Fourth Page"
    }
    
    @IBAction func presentScreen1(_sender: Any) {
        
        _ = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard?.instantiateViewController(identifier: "FifthViewController") as! FifthViewController
        
        vc.navigationItem.largeTitleDisplayMode = .never
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func goToVC2(_ sender: Any) {
        
        for vc in (self.navigationController?.viewControllers ?? [])  {
            if vc is SecondViewController {
                _ = self.navigationController?.popToViewController(vc, animated: true)
                break
            }
        }
    }
    
    @IBAction func seeText(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "First") as! ViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        vc.delegate = self 
    }
}

extension FourthViewController: DataDelegate {
    
    func valueToBeSent(_ string: String) {
        label.text = string
    }
    
    
    


}
