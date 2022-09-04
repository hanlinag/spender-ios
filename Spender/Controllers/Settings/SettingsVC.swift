//
//  SettingsViewController.swift
//  Spender
//
//  Created by Tyler on 19/12/2021.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class SettingsVC: SpenderViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var lblVersio: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblOccupation: UILabel!
    
    @IBOutlet weak var btnLogout: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let vm = SettingsVM.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        
        imgProfile.makeCircleImageView()
        
        lblVersio.text = "v \(vm.appVersion)"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsCell.nib(), forCellReuseIdentifier: SettingsCell.identifier)
    }
    

    @IBAction func btnLogoutDidPressed(_ sender: Any) {
    }
    
   
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.appSettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        cell.configure(for: vm.appSettings[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height * 0.06
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        case 5:
            break
        default:
            break
        }
    }
}
