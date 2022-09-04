//
//  LegalAndPrivacyVC.swift
//  Spender
//
//  Created by Tyler on 04/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class LegalAndPrivacyVC: SpenderViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewCell: UILabel!
    
    let vm = SettingsVM.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    
    
    
}

//MARK: - Delegate and Datasource
extension LegalAndPrivacyVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.legalAndPrivacy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LegalCell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = vm.legalAndPrivacy[indexPath.row].title.localized
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.06
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.loadSafariView(with: vm.legalAndPrivacy[indexPath.row].url)
        
    }
    
}
