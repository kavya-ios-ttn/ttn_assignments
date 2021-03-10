//
//  SecondViewController.swift
//  Bootcamp
//
//  Created by TTN on 24/02/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var subNameLabel: String!
    
    @IBOutlet weak var loginButton3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "Push & Pop"
//
//        let push = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
//        push.setTitle("Push This Screen", for: .normal)
//        push.setTitleColor(.black, for: .normal)
//        push.center = view.center
//        push.addTarget(self, action: #selector(clickPush), for: .touchUpInside)
//        view.addSubview(push)
    }
    
    @IBAction func popViewButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func clickPush() {
        
        let thirdVC = ThirdViewController()
        
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
}

//@IBAction func presentScreen() {
//let storyboard = UIStoryboard(name: "Main", bundle: nil)
//let svc = storyboard.instantiateViewController(withIdentifier: "SecondViewController")

 
