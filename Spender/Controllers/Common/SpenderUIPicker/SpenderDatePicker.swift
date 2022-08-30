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
    
    @IBOutlet var baseView: UIView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var btnDone: UIBarButtonItem!
    
    weak var delegate: SpenderDatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureForDismiss = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tapGestureForDismiss.delegate = self
        self.view.addGestureRecognizer(tapGestureForDismiss)
        
        //min 18, max 105
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())
        datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: -105, to: Date())

        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true) {
            self.delegate?.spenderDatePickerDidSelect(selectedDate: self.datePicker.date.toString())
        }
    }
    
    @objc func datePickerValueChanged() {
        self.delegate?.spenderDatePickerDidSelect(selectedDate: self.datePicker.date.toString())
    }
    
    @IBAction func buttonDoneDidPress(_ sender: Any) {
        dismissView()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == baseView
    }
}

