//
//  DecouvrirCollectionViewCell.swift
//  VisiteSD
//
//  Created by Dimitri SMITH on 09/01/2022.
//

import Foundation
import UIKit

class DecouvrirCollectionViewCell:UICollectionViewCell {
    
    
    @IBOutlet weak var decouvrirImage: UIImageView!
    @IBOutlet weak var decouvrirTitle: UILabel!
    @IBOutlet weak var decouvrirDescription: UILabel!
    
    
    
    func setUpCell (image: UIImage, title: String, description: String) {
        decouvrirImage.image = image
        decouvrirTitle.text = title
        decouvrirDescription.text = description
    }
    
    
}
