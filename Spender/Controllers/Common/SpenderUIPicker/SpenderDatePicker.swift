//
//  SpenderDatePicker.swift
//  Spender
//
//  Created by Tyler on 29/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

protocol SpenderDatePickerDelegate: AnyObject {
    func spenderDatePickerDidSelect(selectedDate: String)
}

class SpenderDatePicker: UIViewController, UIGestureRecognizerDelegate {
    
    var delegate: SpenderUIPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
}
