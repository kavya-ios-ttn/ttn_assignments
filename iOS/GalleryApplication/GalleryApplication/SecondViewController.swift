//
//  SecondViewController.swift
//  GalleryApplication
//
//  Created by TTN on 08/04/21.
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
    
    var timer = Timer()

    @IBOutlet weak var authorButton: UIButton!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        var progress: Float = 0.0
        
        progressView.progress = progress
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (timer) in
            
            progress += 1.0
            self.progressView.progress = progress
            
            if self.progressView.progress == 100.0
            {
                self.progressView.progress = 0.0
            }
        })
    }
    var cc: Stats?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.progress = 0.9
        
        SVProgressHUD.show(withStatus: "It is working...")
       
        SVProgressHUD.dismiss(withDelay: 0.5)
        
        
        let urlString = (cc?.download)!
        
        let url = URL(string: urlString)!
        
        imageView.downloadedFrom(url: url)
        
        
    }
}
