//
//  CardViewVC.swift
//  Test1
//
//  Created by Cojocaru Ionut Alexandru on 12/2/19.
//  Copyright © 2019 Cojocaru Ionut Alexandru. All rights reserved.
//

import UIKit

struct CardModel {
    let name:String
    let password:String
    let expDate:String
    let cardNumber:String
    let type:String
}

class CardViewVC: UIViewController {
    
    var cardModel:CardModel?{
        didSet {
            guard let model = cardModel else {return}
            cardView.NameLabel.text = model.name
            cardView.PasswordLabel.text = model.password
            cardView.ExpDateLabel.text = model.expDate
            cardView.CardNumberLabel.text = model.cardNumber
            cardView.TypeLabel.text = model.type
        }
    }
    
    var cardView:CardView = {
        let cardView = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?.first as? CardView
        return cardView!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.navigationItem.title = "Card"
        self.cardView.BGView.layer.borderWidth = 1
        self.cardView.BGView.layer.borderColor = UIColor.black.cgColor

        self.view.addSubview(cardView)

    }
}
