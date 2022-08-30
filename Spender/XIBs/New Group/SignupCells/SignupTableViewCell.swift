//
//  SignupTableViewCell.swift
//  Spender
//
//  Created by Tyler on 21/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class SignupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textFieldd: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static var identifier = "SignupTableViewCell"
    
    
    static func nib() -> UINib {
        return UINib(nibName: "SignupTableViewCell", bundle: nil)
    }
    
    func configure(dataModel: SignupTableViewCellModel) {
        
        //icon?.isHidden = true
        
        if dataModel.optional ?? false {
            textFieldd.placeholder = dataModel.title.localized + "desc.optional".localized
        } else {
            textFieldd.placeholder = dataModel.title.localized
        }
        
        if dataModel.locked ?? false {
            textFieldd.setRightImage(icon: UIImage(systemName: "lock.shield"))
            textFieldd.isEnabled = false
        }
        
        if let value = dataModel.value, !value.isEmpty {
            textFieldd.text = value
        }
        
        switch dataModel.inputType {
        case .textfield:
            textFieldd.textContentType = .username
            textFieldd.keyboardType    = .default
            break
        case .password:
            textFieldd.textContentType   = .newPassword
            textFieldd.isSecureTextEntry = true
            textFieldd.keyboardType      = .default
            textFieldd.setRightImage(icon: UIImage(systemName: "eye.fill"))
            break
        case .selector:
            textFieldd.textContentType          = .dateTime
            textFieldd.isUserInteractionEnabled = false
            textFieldd.setRightImage(icon: UIImage(systemName: "chevron.down"))
            break
        case .email:
            textFieldd.textContentType = .emailAddress
            textFieldd.keyboardType    = .emailAddress
            break
        case .dateSelector:
            textFieldd.textContentType          = .dateTime
            textFieldd.isUserInteractionEnabled = false
            textFieldd.setRightImage(icon: UIImage(systemName: "chevron.down"))
        }
    }
    
}
