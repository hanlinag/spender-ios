//
//  ConfirmAlert.swift
//  Spender
//
//  Created by Tyler on 14/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

enum SpenderAlertType {
    case normal  //orange
    case success //green
    case error   //red
}

class ConfirmAlertVC: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet var baseView: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOK: UIButton!
    
    var config: AlertConfig?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dismissGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        dismissGesture.delegate = self
        self.baseView.addGestureRecognizer(dismissGesture)
        
        setup()
    }
    
    func setup() {
        lblTitle.text = config?.title?.localized
        lblDesc.text = config?.subtitle?.localized
        
        btnCancel.isHidden = !(config?.showSecondary ?? true) 
        
        if let cancelLabel = config?.secondaryLabel {
            btnCancel.setTitle(cancelLabel, for: .normal)
        }
        
        if let primaryLabel = config?.primaryLabel {
            btnCancel.setTitle(primaryLabel, for: .normal)
        }
        
        switch config?.type {
        case .normal:
            break
        case .error:
            break
        case .success:
            break
        case .none:
            break
        }
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.baseView
    }
    
    
    @objc func dismissView() {
        self.dismiss(animated: true) {
            
        }
    }
    
    
}
