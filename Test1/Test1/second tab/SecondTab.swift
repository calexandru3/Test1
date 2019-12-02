//
//  SecondTab.swift
//  Test1
//
//  Created by Cojocaru Ionut Alexandru on 12/2/19.
//  Copyright © 2019 Cojocaru Ionut Alexandru. All rights reserved.
//

import UIKit

enum secondSegues:String {
    case cardView = "cardTypePickerViewController"
    case dateView = "datePikerViewController"
}

protocol PassDataProtocol: class {
    func setCardType(to:String)
    func setDate(to:String)
}

class SecondTab: UIViewController {
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var expDateField: UITextField!
    @IBOutlet weak var cardNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Nav 2"
        typeField.delegate = self
        expDateField.delegate = self
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        let controller = CardViewVC()
        let cardModel = CardModel.init(name: NameTextField.text != nil ? NameTextField.text! : "",
                                       password: passwordField.text != nil ? passwordField.text! : "",
                                       expDate: expDateField.text != nil ? expDateField.text! : "",
                                       cardNumber: cardNumberField.text != nil ? cardNumberField.text! : "",
                                       type: typeField.text != nil ? typeField.text! : "")
        controller.cardModel = cardModel
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension SecondTab:PassDataProtocol{
    func setDate(to: String) {
        self.expDateField.text = to
    }
    
    func setCardType(to: String) {
        self.typeField.text = to
    }
}

extension SecondTab:UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            let controller = storyboard!.instantiateViewController(withIdentifier: secondSegues.cardView.rawValue) as! CardTypePickerViewController
            controller.delegate = self
            self.present(controller, animated: true, completion: nil)
        } else {
            let controller = storyboard!.instantiateViewController(withIdentifier: secondSegues.dateView.rawValue) as! DatePikerViewController
            controller.delegate = self
            self.present(controller, animated: true, completion: nil)
        }
        
        return false
    }
}
