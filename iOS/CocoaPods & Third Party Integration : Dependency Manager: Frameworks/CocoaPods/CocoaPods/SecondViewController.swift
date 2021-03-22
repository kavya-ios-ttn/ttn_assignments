//
//  SecondViewController.swift
//  CocoaPods
//
//  Created by TTN on 22/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

import SVProgressHUD

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        print("URL is here \(url)")
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}


class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var IDLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var widthLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    

    
    var cc: Stats?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show(withStatus: "It is working...")
       
        SVProgressHUD.dismiss(withDelay: 0.5)
        
        IDLabel.text = cc?.id
        authorLabel.text = cc?.author
        widthLabel.text = "\((cc?.width)!)"
        heightLabel.text = "\((cc?.height)!)"
        
        
        
        let urlString = (cc?.download_url)!
        
        let url = URL(string: urlString)!
        
        imageView.downloadedFrom(url: url)
        
        
    }
    

    
}
