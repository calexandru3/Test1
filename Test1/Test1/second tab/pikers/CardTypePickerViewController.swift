//
//  CardTypePickerViewController.swift
//  Test1
//
//  Created by Cojocaru Ionut Alexandru on 12/2/19.
//  Copyright © 2019 Cojocaru Ionut Alexandru. All rights reserved.
//

import UIKit

class CardTypePickerViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let types = ["Visa", "MasterCard", "American Express"]
    weak var delegate: PassDataProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    @IBAction func buttonCliked(_ sender: Any) {
        delegate?.setCardType(to: "\(types[self.pickerView.selectedRow(inComponent: 0)])")
        self.dismiss(animated: true, completion: nil)
    }
}

extension CardTypePickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.types[row]
    }
}

extension CardTypePickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.types.count
    }
}
