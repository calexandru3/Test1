//
//  ParentVC.swift
//  Test1
//
//  Created by Cojocaru Ionut Alexandru on 12/2/19.
//  Copyright © 2019 Cojocaru Ionut Alexandru. All rights reserved.
//

import UIKit

class ParentVC: UIViewController {
    
    enum segues:String {
        case childView = "ToChildView"
    }
    
    @IBOutlet weak var button: UIButton!
    let childVC = ChildVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Nav 4"
        addChild(childVC)
        self.view.addSubview(childVC.view)
        
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        childVC.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        childVC.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        childVC.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        childVC.view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        childVC.view.isHidden = true
        childVC.view.isUserInteractionEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == segues.childView.rawValue) {
            if segue.destination is ChildView {
                let VC = segue.destination as! ChildView
                VC.view.backgroundColor = .black
            }
        }
    }
    
    @IBAction func buttonCliked(_ sender: Any) {
        childVC.view.isHidden = !childVC.view.isHidden
    }
}

