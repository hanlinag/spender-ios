//
//  CreateNewWalletVC.swift
//  Spender
//
//  Created by Tyler on 07/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class CreateNewWalletVC: SpenderViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnCreate: UIButton!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldType: UITextField!
    
    var currentTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CardCell.nib(), forCellWithReuseIdentifier: CardCell.identifier)
        
        btnClose.layer.masksToBounds = true
        btnClose.layer.cornerRadius = btnClose.frame.height / 2
        
        textFieldType.setRightImage(icon: UIImage(systemName: "chevron.down"))
        textFieldType.delegate = self
        
        textFieldName.delegate = self
    }
    
    func showUIPicker() {
        
        let storyboard = UIStoryboard(name: "SpenderUIPicker", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SpenderUIPicker") as! SpenderUIPicker
        vc.modalTransitionStyle     = .crossDissolve
        vc.modalPresentationStyle   = .overCurrentContext
        vc.delegate = self //very important
        vc.data = walletType
        self.present(vc, animated: true)
    }
}


 //MARK: - TextField Related
extension CreateNewWalletVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
        
        if currentTextField == textFieldType {
            textFieldType.resignFirstResponder()
            showUIPicker()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        currentTextField = textField
    }
}

//MARK: - Collection View Deleage and Datasource and ScrollView
extension CreateNewWalletVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        
        pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width * 0.86 , height: collectionView.frame.size.height  )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 0, left: 10, bottom: 0, right: 20)
    }
}

//MARK: - UIPicker Delegate
extension CreateNewWalletVC: SpenderUIPickerDelegate {
    
    func spenderPickerDidSelect(selectedItem: String) {
        debugPrint("Selected item is: \(selectedItem)")
        textFieldType.text = selectedItem
    }
}
