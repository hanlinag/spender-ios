//
//  Onboarding.swift
//  Spender
//
//  Created by Tyler on 14/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class OnboardingVC: SpenderViewController {
    
    @IBOutlet weak var buttonForward: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        buttonForward.layer.masksToBounds = true
        buttonForward.layer.cornerRadius = buttonForward.frame.size.height * 0.5
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(OnboardingCell.nib(), forCellWithReuseIdentifier: OnboardingCell.identifier)
        
        pageControl.numberOfPages = onboardingDict.count
        pageControl.currentPage = 0
        
    }
    
    @IBAction func pageControlValueDidChange(_ sender: Any) {
        
        
    }
    
    
    @IBAction func buttonForwardDidPress(_ sender: Any) {
        if pageControl.currentPage == 2 {
            self.dismiss(animated: true)
        }
    }
    
}


//MARK: - Collection Delegate and Datasource
extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
        cell.configure(data: onboardingDict[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.frame.size
    }
}

extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width * 0.5
        
        pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
        collectionView.scrollToItem(at: IndexPath(row: pageControl.currentPage, section: 0), at: .centeredHorizontally , animated: true)
        
        if pageControl.currentPage == 0 {
            buttonForward.backgroundColor = .systemBlue
        } else if pageControl.currentPage == 1 {
            buttonForward.backgroundColor = UIColor(named: "ColorAccent")
        } else {
            buttonForward.backgroundColor = .black
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        scrollView.isUserInteractionEnabled = false
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        scrollView.isUserInteractionEnabled = true
    }
}
