//
//  ViewController.swift
//  VisiteSD
//
//  Created by Dimitri SMITH on 06/01/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var decouvrirCollectionView: UICollectionView!
    @IBOutlet weak var backGroundImageView: UIImageView!
    @IBOutlet weak var decouvrirBackGroundImageView: UIImageView!
    
    var articles:[SimpleArticle]?
    var tabBarTag: Bool = true
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        decouvrirCollectionView.delegate = self
        decouvrirCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
        APIManager.shared.getData(endPoint: "") { articles in
            self.articles = articles
            DispatchQueue.main.async {
                self.decouvrirCollectionView.reloadData()
            }
        }
        
        // Add filter to backGroundImage
        let filteredImage = backGroundImageView.image?.addBlackFilter(image: backGroundImageView.image!)
        backGroundImageView.image = filteredImage
        
        decouvrirBackGroundImageView.layer.borderWidth = 2
        decouvrirBackGroundImageView.layer.borderColor = UIColor.white.cgColor

        
        // Setup the TabBar with Custom color
        if tabBarTag == true {
            self.tabBarController?.tabBar.tintColor = UIColor(named: "iconDecouvrir")
        } else {
            self.tabBarController?.tabBar.tintColor = UIColor.blue
        }
    }
    
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "decouvrirCell", for: indexPath) as! DecouvrirCollectionViewCell
        
        let article = articles![indexPath.row]
        let image = UIImage(data: article.data)
        let resizedImage = image?.resizedImage(image: image!)
        cell.decouvrirImage.contentMode = .scaleAspectFill
        cell.setUpCell(image: resizedImage!, title: article.title, description: article.description)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        
        
    }
    
}

