//
//  AddTransaction.swift
//  Spender
//
//  Created by Tyler on 14/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class AddTransactionVC: SpenderViewController {
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var walletView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        walletView.layer.borderColor = UIColor.gray.withAlphaComponent(0.6).cgColor
        walletView.layer.borderWidth = 1
        walletView.layer.masksToBounds = true
        walletView.layer.cornerRadius = 5
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(CategoryCell.nib(), forCellWithReuseIdentifier: CategoryCell.identifier)
    }
    
}


//MARK: - Collection Delegate and Datasource
extension AddTransactionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        
        return cell
    }
    
}

extension AddTransactionVC: UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
