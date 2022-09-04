//
//  ChangeLanguageVC.swift
//  Spender
//
//  Created by Tyler on 04/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class ChangeLanguageVC: SpenderViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let vm = SettingsVM.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    


}

//MARK: - TableView Delegate and DataSource
extension ChangeLanguageVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.languageElement.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = vm.languageElement[indexPath.row].title
    
        cell.contentConfiguration = content
        
        cell.accessoryType = vm.languageElement[indexPath.row].selected ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.06
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.popViewController(animated: true)
    }
}
