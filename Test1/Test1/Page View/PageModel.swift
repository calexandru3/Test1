//
//  PgeViewPage.swift
//  Test1
//
//  Created by Cojocaru Ionut Alexandru on 12/2/19.
//  Copyright © 2019 Cojocaru Ionut Alexandru. All rights reserved.
//

import UIKit

class PageModel: UIViewController {
    
    var tag:Int = 0{
        didSet {
            label.text = "Welcome from page \(tag)"
        }
    }
    
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sizeToFit()
        imageView.image = UIImage(named: "appleLogo")
        return imageView
    }()
    
    let label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var button:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Navigate to next VC", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleButtonClick(){
        let secondVC = SecondVC()
        secondVC.tag = self.tag
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpComponents()
    }
    
    fileprivate func setUp(){
        self.view.backgroundColor = .white
    }
    
    fileprivate func setUpComponents(){
        self.view.addSubview(imageView)
        self.view.addSubview(label)
        self.view.addSubview(button)

        imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: self.view.frame.width/2).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: self.view.frame.width/2).isActive = true
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
