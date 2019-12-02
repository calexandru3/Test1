//
//  CustomTabBarController.swift
//  Test1
//
//  Created by Cojocaru Ionut Alexandru on 12/2/19.
//  Copyright © 2019 Cojocaru Ionut Alexandru. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    fileprivate func setUp(){
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.barStyle = .black
        self.tabBar.items?[0].title = "Page View"
        self.tabBar.items?[0].image = UIImage(named: "home")
    }
}
