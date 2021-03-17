//
//  ViewController.swift
//  PageViewController
//
//  Created by TTN on 16/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    
    var myControllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = UIViewController()
        vc.view.backgroundColor = .systemPink
        myControllers.append(vc)
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .systemBlue
        myControllers.append(vc1)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .brown
        myControllers.append(vc2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            
            self.presentPageVC()
            
        })
    }
    
    func presentPageVC() {
        guard let first = myControllers.first else {
            return
        }
        let vc = UIPageViewController()
        
        vc.delegate = self
        vc.dataSource = self
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        
        present(vc, animated: true)
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = myControllers.firstIndex(of: viewController), index > 0 else {
            return nil
        }
        let before = index - 1
        
        return myControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = myControllers.firstIndex(of: viewController), index < (myControllers.count - 1) else {
            return nil
        }
        let after = index + 1
        
        return myControllers[after]
        
    }

}

