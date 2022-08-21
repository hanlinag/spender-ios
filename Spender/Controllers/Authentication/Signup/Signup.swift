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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate   = self
        tableView.dataSource = self
        
    }
}

extension Signup: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.signupTableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: signupTableCell, for: indexPath)
        
        let imgLogo = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imgLogo.image = UIImage(named: "logo-text-orange")
        //imgLogo.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        cell.contentView.addSubview(imgLogo)
        //cell.contentView = imgLogo
        
        return cell
    }
    
    
    
    
}
