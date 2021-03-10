//
//  ViewController.swift
//  NavigationDemo
//
//  Created by TTN on 08/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTapButton() {
        //Create and present tab bar controller
        
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        
        vc1.title = "Home"
        vc2.title = "Help"
        vc3.title = "Settings"
        vc4.title = "Contact"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let images = ["house", "bell", "person.circle", "star"]
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }

}

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            view.backgroundColor = .red
            title = "Home"
        }
    }
    

class SecondViewController: UIViewController {

override func viewDidLoad() {
    super.viewDidLoad()
        view.backgroundColor = .green
        title = "Help"
    }
}

class ThirdViewController: UIViewController {

override func viewDidLoad() {
    super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Settings"
    }
}

class FourthViewController: UIViewController {

override func viewDidLoad() {
    super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Contact"
    }
}



    

