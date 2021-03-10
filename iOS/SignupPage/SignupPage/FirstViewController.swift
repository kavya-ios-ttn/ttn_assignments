//
//  FirstViewController.swift
//  SignupPage
//
//  Created by TTN on 01/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
//    @IBAction func NextButton(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//
//
//    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let yourView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        yourView.layer.borderWidth = 10
//        yourView.layer.borderColor = UIColor.red.cgColor
//        view.addSubview(yourView)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "HOME"
    }

    @IBAction func nextButtonTapped() {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController")

            navigationController?.pushViewController(secondVC, animated: true)
        }


}
