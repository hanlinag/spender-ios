//
//  SpenderUIPicker.swift
//  Spender
//
//  Created by Tyler on 29/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

protocol SpenderUIPickerDelegate: AnyObject {
    func spenderPickerDidSelect(selectedItem: String)
}

class SpenderUIPicker: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIGestureRecognizerDelegate {
    
    @IBOutlet var baseView: UIView!
    
    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var uiPicker: UIPickerView!
    
    var data: [String]?
    
    var delegate: SpenderUIPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiPicker.delegate   = self
        uiPicker.dataSource = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func buttonDoneDidTouch(_ sender: Any) {
        dismissView()
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.baseView
    }
    
    //MARK: - Delegates and DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data?[row] ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.spenderPickerDidSelect(selectedItem: data?[row] ?? "")
        
    }
}
