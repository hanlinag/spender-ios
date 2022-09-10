//
//  EditProfileHeaderCell.swift
//  Spender
//
//  Created by Tyler on 06/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class EditProfileHeaderCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    static var identifier = "EditProfileHeaderCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "EditProfileHeaderCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProfileCell.nib(), forCellWithReuseIdentifier: ProfileCell.identifier)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK: - UICollectionView Delegate, Datasource
extension EditProfileHeaderCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        cell.cnnfigure(data: profileData[indexPath.row])
        
        return cell
    }
    
    
}
