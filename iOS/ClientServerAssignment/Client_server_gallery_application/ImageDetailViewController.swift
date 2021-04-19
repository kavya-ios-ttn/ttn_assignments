//
//  ImageDetailViewController.swift
//  Client_server_gallery_application
//
//  Created by TTN on 20/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
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
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}


class ImageDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var authorButton: UIButton!
    
    open var gotDetails: imagesDetails?
    var objCollectionViewController = GalleryViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorButton.setTitle(gotDetails?.author, for: .normal)
        
        let id : String = "\((gotDetails?.id) ?? 0)"
        let urlString = "https://picsum.photos/200/300?image=" + id
        let url = URL(string: urlString)!
        
        imageView.downloadedFrom(url: url)
    }
    
    @IBAction func authorButtonTapped() {
        
        
        if let url = URL(string: gotDetails?.author_url ?? "www.google.com") {
            UIApplication.shared.open(url)
        }
        
    }
    
    @IBAction func downloadButtonTapped()  {
        let id : String = "\((gotDetails?.id) ?? 0)"
        let urlString = "https://picsum.photos/200/300?image=" + id
        let url = URL(string: urlString)!
        let data = try? Data(contentsOf: url)
        
        UIImageWriteToSavedPhotosAlbum(UIImage(data: data!)!, nil, nil, nil)
    }
    
}
