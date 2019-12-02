//
//  ProgramaticViews.swift
//  Test1
//
//  Created by Cojocaru Ionut Alexandru on 12/2/19.
//  Copyright © 2019 Cojocaru Ionut Alexandru. All rights reserved.
//

import UIKit

class ProgramaticViews: UIViewController {
    
    var views = Array<UIView>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Nav 3"
    }
    
    @IBAction func ButtonCliked(_ sender: Any) {
        if views.isEmpty {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .random
            self.view.addSubview(view)
            
            view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
            view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            view.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            views.append(view)
        } else if views.count == 5{
            let alert = UIAlertController(title: "Max Number", message: "You can`t add more views :(", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            alert.addAction(UIAlertAction(title: "Restore", style: .default, handler: { action in
                self.view.subviews.forEach({
                    if type(of: $0) != UIButton.self {
                        $0.removeFromSuperview()
                    }
                })
                self.views.removeAll()
            }))
            self.present(alert, animated: true)
        } else {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .random
            self.view.addSubview(view)
            
            view.topAnchor.constraint(equalTo: views.last!.bottomAnchor, constant: 20).isActive = true
            view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            view.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            views.append(view)
        }
    }
}
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
