//
//  MonVoyageViewController.swift
//  VisiteSD
//
//  Created by Dimitri SMITH on 11/01/2022.
//

import Foundation
import UIKit

class MonVoyageViewController: UIViewController {
    
    
    var tabBarTag: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if tabBarTag == true {
            self.tabBarController?.tabBar.tintColor = UIColor(named: "iconMonVoyage")
        } else {
            self.tabBarController?.tabBar.tintColor = UIColor.blue
        }
    }
}
