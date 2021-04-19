//
//  ViewController.swift
//  Client_server_gallery_application
//
//  Created by TTN on 13/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBarImage()
        
    }
    
    @IBAction func enterGalleryButtonTapped(_ sender: Any) {
        
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController

        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func NavBarImage() {
        let navController = navigationController!
        let image = UIImage(named: "logo") //Your logo url here
        let imageView = UIImageView(image: image)
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height - 2
        imageView.frame = CGRect(x: 0, y: 0, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
}
