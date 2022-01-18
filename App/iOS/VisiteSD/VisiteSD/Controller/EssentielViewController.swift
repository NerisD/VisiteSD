//
//  EssentielViewController.swift
//  VisiteSD
//
//  Created by Dimitri SMITH on 11/01/2022.
//

import Foundation
import UIKit

class EssentielViewController: UIViewController {
    
    var tabBarTag: Bool = true
    
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if tabBarTag == true {
            self.tabBarController?.tabBar.tintColor = UIColor(named: "iconEssentiel")
        } else {
            self.tabBarController?.tabBar.tintColor = UIColor.blue
        }
        
    }
    
}
