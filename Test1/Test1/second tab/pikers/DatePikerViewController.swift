//
//  DatePikerView.swift
//  Test1
//
//  Created by Cojocaru Ionut Alexandru on 12/2/19.
//  Copyright © 2019 Cojocaru Ionut Alexandru. All rights reserved.
//

import UIKit

class DatePikerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: PassDataProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonCliked(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yy"
        let text = dateFormatter.string(from: datePicker.date)
        
        delegate?.setDate(to: text)
        self.dismiss(animated: true, completion: nil)
    }
}
