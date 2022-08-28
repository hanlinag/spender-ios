//
//  Signup.swift
//  Spender
//
//  Created by Tyler on 14/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class SignupVC: SpenderViewController {
    
    @IBOutlet weak var imgTick: UIImageView!
    @IBOutlet weak var lblTandC: UILabel!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    @IBOutlet weak var lblLogin: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var tableHeaderHeight: CGFloat?
    private var tableCellHeight: CGFloat?
    
    private var isTicked: Bool = false
    
    let vm = AuthVM.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        tableHeaderHeight = view.frame.size.height * 0.28
        tableCellHeight = view.frame.size.height * 0.07
        
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.register(SignupHeaderTableViewCell.nib(), forCellReuseIdentifier: SignupHeaderTableViewCell.identifier)
        tableView.register(SignupTableViewCell.nib(), forCellReuseIdentifier: SignupTableViewCell.identifier)
        
        if self.vm.signupMode == .normal {
            btnRegister.setTitle("btn.register".localized, for: .normal)
            
            lblLogin.isHidden = false
        } else {
            btnRegister.setTitle("btn.create_account".localized, for: .normal)
            lblLogin.isHidden = true
        }
        
        //Actions
        let imgTickGesture = UITapGestureRecognizer(target: self, action: #selector(imgTickDidPress(_:)))
        imgTick.addGestureRecognizer(imgTickGesture)
        
        let loginGesture  = UITapGestureRecognizer(target: self, action: #selector(loginDidPress(_:)))
        lblLogin.addGestureRecognizer(loginGesture)
        
    }
    
    @IBAction func registerButtonDidPress(_ sender: Any) {
        //TO DO: Call Register API
    }
    
    @objc func loginDidPress(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true) {
            self.vm.clearAuthInfo()
        }
    }
    
    @objc func imgTickDidPress(_ sender: UITapGestureRecognizer) {
        imgTick.image =  self.isTicked ? UIImage(named: "tick-off") :  UIImage(named: "tick-on")
        self.isTicked = !self.isTicked
    }
    
}

extension SignupVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.vm.signupMode == .normal {
            return signupTableCellModel.count + 1
            
        } else {
            return signupWithProvidersTableCellModel.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let header = tableView.dequeueReusableCell(withIdentifier: SignupHeaderTableViewCell.identifier, for: indexPath) as! SignupHeaderTableViewCell
            
            header.configure(signupMode: self.vm.signupMode)
            
            return header
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SignupTableViewCell.identifier, for: indexPath) as! SignupTableViewCell
            
            if self.vm.signupMode == .normal {
                cell.configure(dataModel: signupTableCellModel[indexPath.row - 1])
            } else {
                cell.configure(dataModel: signupWithProvidersTableCellModel[indexPath.row - 1])
            }
            
            cell.frame.size.height = self.tableCellHeight ?? 40.0
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.tableHeaderHeight ?? 200.0
        } else {
            return self.tableCellHeight ?? 44.0
        }
    }
    
    
}
