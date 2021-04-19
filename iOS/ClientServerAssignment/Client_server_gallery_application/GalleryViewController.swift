//
//  GalleryViewController.swift
//  Client_server_gallery_application
//
//  Created by TTN on 20/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var images = [imagesDetails]()
    
    var viewControllerObj = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON {
            self.collectionView.reloadData()
            
        }
        
        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        self.addNavBarImage()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func addNavBarImage() {
        let navController = navigationController!
        let image = UIImage(named: "logo") //Your logo url here
        let imageView = UIImageView(image: image)
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height - 2
        imageView.frame = CGRect(x: 0, y: 0, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        
        cell.configure(with: images[indexPath.item])

        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageDetailViewController") as! ImageDetailViewController
            vc.gotDetails = images[indexPath.item]
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        
        let url = URL(string: "https://picsum.photos/list")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                    self.images = try JSONDecoder().decode([imagesDetails].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                }catch {
                    print("JSON NOT FOUND")
                }
            }
        }.resume()
        
    }
    
}

