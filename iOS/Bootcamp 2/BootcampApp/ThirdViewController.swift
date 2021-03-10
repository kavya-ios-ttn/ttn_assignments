//
//  ThirdViewController.swift
//  Bootcamp
//
//  Created by TTN on 25/02/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //var nameLabel: String!

    override func viewDidLoad() {
        super.viewDidLoad()

       let pop = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        pop.setTitle("Pop This Screen", for: .normal)
        pop.setTitleColor(.black, for: .normal)
        pop.center = view.center
        pop.addTarget(self, action: #selector(clickPop), for: .touchUpInside)
        view.addSubview(pop)
    }
    
    @objc func clickPop() {
        print("Pop")
    }

    

}
