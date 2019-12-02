//
//  SecondVC.swift
//  Test1
//
//  Created by Cojocaru Ionut Alexandru on 12/2/19.
//  Copyright © 2019 Cojocaru Ionut Alexandru. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var tag:Int = 0{
        didSet {
            label.text = "Welcome frome page \(tag)"
        }
    }
    
    let label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUp()
    }
    
    fileprivate func setUp(){
        self.view.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        self.navigationController!.navigationBar.tintColor = .red
    }
}
