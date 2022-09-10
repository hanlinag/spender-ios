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
    
    private var selectorItemIndex = 0
    private var dateSelectorItemIndex = 0
    
    private var isTicked: Bool = false
    
    private var signupTableCells: [SignupTableViewCellModel]?
    
    let vm = AuthVM.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if vm.signupMode == .editProfile {
            self.navigationController?.navigationBar.isHidden = false
            self.navigationItem.title = "settings.edit_profile".localized
        } else {
            self.navigationController?.navigationBar.isHidden = true
        }
        
        
        tableHeaderHeight = view.frame.size.height * 0.28
        tableCellHeight = view.frame.size.height * 0.07
        
        if self.vm.signupMode == .normal {
            btnRegister.setTitle("btn.register".localized, for: .normal)
            lblLogin.isHidden = false
            
            signupTableCells = getSignupTableCellModel()
            
        } else if self.vm.signupMode == .editProfile {
            btnRegister.setTitle("btn.update".localized, for: .normal)
            lblLogin.isHidden = true
            
            signupTableCells = getEditProfileTableCellModel()
        } else {
            btnRegister.setTitle("btn.create_account".localized, for: .normal)
            lblLogin.isHidden = true
            
            signupTableCells = getSignupWithProvidersTableCellModel()
        }
        
        
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.register(SignupHeaderTableViewCell.nib(), forCellReuseIdentifier: SignupHeaderTableViewCell.identifier)
        tableView.register(SignupTableViewCell.nib(), forCellReuseIdentifier: SignupTableViewCell.identifier)
        tableView.register(EditProfileHeaderCell.nib(), forCellReuseIdentifier: EditProfileHeaderCell.identifier)
        
        
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
        
        return (signupTableCells?.count ?? 0) + 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            if self.vm.signupMode == .editProfile {
                let profile = tableView.dequeueReusableCell(withIdentifier: EditProfileHeaderCell.identifier, for: indexPath) as! EditProfileHeaderCell
                profile.selectionStyle = .none
                
                return profile
                
            } else {
                let header = tableView.dequeueReusableCell(withIdentifier: SignupHeaderTableViewCell.identifier, for: indexPath) as! SignupHeaderTableViewCell
                header.selectionStyle = .none
                header.configure(signupMode: self.vm.signupMode)
                
                return header
            }
            
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SignupTableViewCell.identifier, for: indexPath) as! SignupTableViewCell
            
            
            cell.configure(dataModel: (signupTableCells?[indexPath.row - 1])!)
            
            cell.selectionStyle = .none
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.vm.signupMode == .normal {
            
            if signupTableCells?[indexPath.row - 1].inputType == .selector {
                selectorItemIndex = indexPath.row
                showUIPicker()
            } else if signupTableCells?[indexPath.row - 1].inputType == .dateSelector {
                dateSelectorItemIndex = indexPath.row
                showUIDatePicker()
            }
        }
    }
    
    
    
    func showUIPicker() {
        let sortedOccupation = occupations.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        
        let storyboard = UIStoryboard(name: "SpenderUIPicker", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SpenderUIPicker") as! SpenderUIPicker
        vc.modalTransitionStyle     = .crossDissolve
        vc.modalPresentationStyle   = .overCurrentContext
        vc.delegate = self //very important
        vc.data = sortedOccupation
        self.present(vc, animated: true)
    }
    
    func showUIDatePicker() {
        let storyboard = UIStoryboard(name: "SpenderDatePicker", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SpenderDatePicker") as! SpenderDatePicker
        vc.modalTransitionStyle     = .crossDissolve
        vc.modalPresentationStyle   = .overCurrentContext
        vc.delegate = self //very important
        self.present(vc, animated: true)
    }
    
}

//MARK: - UIPicker Delegate
extension SignupVC: SpenderUIPickerDelegate {
    func spenderPickerDidSelect(selectedItem: String) {
        
        signupTableCells?[selectorItemIndex - 1].value = selectedItem
        
        signupTableCells = signupTableCells?.sorted(by: {
            $0.order < $1.order
        })
        
        let indexPath = IndexPath(item: selectorItemIndex , section: 0)
        
        if let cell = tableView.cellForRow(at: indexPath) as? SignupTableViewCell {
            //cell?.reloadInputViews()
            cell.configure(dataModel: (signupTableCells?[selectorItemIndex - 1])!)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
}


//MARK: - UIDatePicker Delegate
extension SignupVC: SpenderDatePickerDelegate {
    func spenderDatePickerDidSelect(selectedDate: String) {
        debugPrint("Selected date \(selectedDate)")
        signupTableCells?[dateSelectorItemIndex - 1].value = selectedDate
        
        signupTableCells = signupTableCells?.sorted(by: {
            $0.order < $1.order
        })
        
        let indexPath = IndexPath(item: dateSelectorItemIndex , section: 0)
        
        if let cell = tableView.cellForRow(at: indexPath) as? SignupTableViewCell {
            //cell?.reloadInputViews()
            cell.configure(dataModel: (signupTableCells?[dateSelectorItemIndex - 1])!)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
}
