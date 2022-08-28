//
//  Signup.swift
//  Spender
//
//  Created by Tyler on 14/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class Signup: SpenderViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let vm = AuthVM.shared
    
    private var tableHeaderHeight: CGFloat?
    private var tableCellHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        tableHeaderHeight = view.frame.size.height * 0.28
        tableCellHeight = view.frame.size.height * 0.07
        
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.register(SignupHeaderTableViewCell.nib(), forCellReuseIdentifier: SignupHeaderTableViewCell.identifier)
        tableView.register(SignupTableViewCell.nib(), forCellReuseIdentifier: SignupTableViewCell.identifier)
        
        
    }
}

extension Signup: UITableViewDelegate, UITableViewDataSource {
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
