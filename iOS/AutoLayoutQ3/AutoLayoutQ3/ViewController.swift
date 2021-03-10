//
//  ViewController.swift
//  AutoLayoutQ3
//
//  Created by TTN on 09/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private let myView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .link
        return myView
    }()
    
    private let secondView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .green
        return myView
    }()
    
    private let thirdView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .yellow
        return myView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        myView.addSubview(secondView)
        myView.addSubview(thirdView)
        addConstraints()
       
    }
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        //Add view 1 (blue)
        constraints.append(myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        
        //Activate (Applying)
        NSLayoutConstraint.activate(constraints)
        
        
        //Add view 2 (Green)
        constraints.append(secondView.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.5))
        constraints.append(secondView.heightAnchor.constraint(equalTo: myView.heightAnchor, multiplier: 0.5))
        
        //Activate (Applying)
        NSLayoutConstraint.activate(constraints)
        
        
        //Add view 3 (Yellow)
        constraints.append(thirdView.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 1.5))
        constraints.append(thirdView.heightAnchor.constraint(equalTo: myView.heightAnchor, multiplier: 1.5))
        
        NSLayoutConstraint.activate(constraints)
        
    }


}

