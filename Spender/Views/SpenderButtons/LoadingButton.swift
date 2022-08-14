//
//  LoadingButton.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

@IBDesignable class LoadingButton: UIButton {
    
    private var _isLoading: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Loading Animation
    lazy private var loadingView: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView()
        
        loadingIndicator.color = self.titleColor(for: .normal)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(loadingIndicator)
        
        loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        return loadingIndicator
    }()
    
    // MARK: Loading
    var isLoading: Bool {
        get { return _isLoading }
        set {
            guard newValue != isLoading || newValue  else { return }
            isUserInteractionEnabled = !newValue
            newValue ? loadingView.startAnimating() : loadingView.stopAnimating()
            _isLoading = newValue
            cacheTitle(newValue)
        }
    }
    
    // MARK: Hide title
    private var cachedImage: UIImage?
    private var cachedTitle: String?
    private var cachedAttrTitle: NSAttributedString?
    
    private func cacheTitle(_ toCache: Bool = true) {
        let imageToCache =      toCache ? image(for: .normal) : nil
        let imageToButton =     toCache ? nil : cachedImage
        let titleToCache =      toCache ? title(for: .normal) : nil
        let titleToButton =     toCache ? nil : cachedTitle
        let attrTitleToCache =  toCache ? attributedTitle(for: .normal) : nil
        let attrTitleToButton = toCache ? nil : cachedAttrTitle
        
        if let imageToCache = imageToCache { cachedImage = imageToCache }
        if let titleToCache = titleToCache { cachedTitle = titleToCache }
        if let attrTitleToCache = attrTitleToCache { cachedAttrTitle = attrTitleToCache }
        
        setImage(imageToButton, for: .normal)
        setTitle(titleToButton, for: .normal)
        setAttributedTitle(attrTitleToButton, for: .normal)
    }
}

extension Reactive where Base: LoadingButton {
    var isLoading: Binder<Bool> {
        return Binder(self.base) { button, isLoading in
            button.isLoading = isLoading
        }
    }
}

