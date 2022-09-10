//
//  Localizable.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import UIKit

protocol Localizable {
    func localize()
}

private enum Key {
    static var text         = "text"
    static var title        = "title"
    static var placeholder  = "placeholder"
    static var prompt       = "prompt"
}

extension String {
    func localizedArgs(_ arguments: Any...) -> String {
        var string = localized
        for parameter in (arguments.map{ "\($0)" }) {
            if let range = string.range(of: "%@") {
                string = string.replacingCharacters(in: range, with: parameter)
            } else {
                break
            }
        }
        return string
    }
    
    func localizedBoldedWith(_ arguments: Any...) -> NSAttributedString {
        let string = NSMutableAttributedString(string: localized, attributes: [.font: UIFont.appRegular(size: 16)])
        
        for parameter in (arguments.map{ "\($0)" }) {
            let range = string.mutableString.range(of: "%@")
            let boldedPart = NSAttributedString(string: parameter, attributes: [.font: UIFont.appMedium(size: 16)])
            string.replaceCharacters(in: range, with: boldedPart)
        }
        
        return string
    }
}

extension UITextField: Localizable {
    
    @IBInspectable var localizedPlaceholder: String {
        get { return associated(&Key.placeholder) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.placeholder)
            localizePlaceholder()
        }
    }
    
    @IBInspectable var localizedText: String {
        get { return associated(&Key.text) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.text)
            localizeText()
            
        }
    }
    
    func localize() {
        localizePlaceholder()
        localizeText()
    }
    
    private func localizePlaceholder() {
        if !localizedPlaceholder.isEmpty { placeholder = localizedPlaceholder.localized }
    }
    private func localizeText() {
        if !localizedText.isEmpty { text = localizedText.localized }
    }
}

extension UITextView: Localizable {
    
    @IBInspectable var localizedText: String {
        get { return associated(&Key.text) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.text)
            localize()
        }
    }
    
    func localize() {
        if !localizedText.isEmpty { text = localizedText.localized }
    }
    
}

extension UIBarItem: Localizable {
    
    @IBInspectable var localizedTitle: String {
        get { return associated(&Key.title) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.title)
            localize()
        }
    }
    
    func localize() {
        if !localizedTitle.isEmpty { title = localizedTitle.localized }
    }
    
}

extension UILabel: Localizable {
    
    @IBInspectable var localizedText: String {
        get { return associated(&Key.text) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.text)
            localize()
        }
    }
    
    func localize() {
        if !localizedText.isEmpty { text = localizedText.localized }
    }
    
}

extension UINavigationItem: Localizable {
    
    @IBInspectable var localizedTitle: String {
        get { return associated(&Key.title) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.title)
            localizeTitle()
        }
    }
    
    @IBInspectable var localizedPrompt: String {
        get { return associated(&Key.prompt) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.prompt)
            localizePrompt()
        }
    }
    
    func localize() {
        localizeTitle()
        localizePrompt()
    }
    
    private func localizeTitle() {
        if !localizedTitle.isEmpty { title = localizedTitle.localized }
    }
    private func localizePrompt() {
        if !localizedPrompt.isEmpty { prompt = localizedPrompt.localized }
    }
}

extension UIButton: Localizable {
    
    @IBInspectable var localizedTitle: String {
        get { return associated(&Key.title) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.title)
            localize()
        }
    }
    
    @objc func localize() {
        if !localizedTitle.isEmpty {
            titleLabel?.text = localizedTitle.localized
            setTitle(localizedTitle.localized, for: UIControl.State())
        }
    }
    
}

extension UISearchBar: Localizable {
    
    @IBInspectable var localizedPrompt: String {
        get { return associated(&Key.prompt) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.prompt)
            localizePrompt()
        }
    }
    
    @IBInspectable var localizedPlaceholder: String {
        get { return associated(&Key.placeholder) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.placeholder)
            localizePlaceholder()
        }
    }
    
    func localize() {
        localizePrompt()
        localizePlaceholder()
    }
    private func localizePrompt() {
        if !localizedPrompt.isEmpty { prompt = localizedPrompt.localized }
    }
    private func localizePlaceholder() {
        if !localizedPlaceholder.isEmpty { placeholder = localizedPlaceholder.localized }
    }
}

extension UISegmentedControl: Localizable {
    
    @IBInspectable var localized: Bool {
        get { return true }
        set {
            if newValue {
                var titles = [String]()
                for index in 0..<numberOfSegments {
                    guard let key = titleForSegment(at: index) else { break }
                    titles.append(key)
                }
                localizedTitles = titles
            } else {
                localizedTitles = []
            }
        }
    }
    
    private var localizedTitles: [String] {
        get { return associated(&Key.title) ?? [] }
        set {
            associate(newValue as AnyObject?, &Key.title)
            localize()
        }
    }
    
    func localize() {
        localizeFont()
        guard !localizedTitles.isEmpty else { return }
        
        for index in 0..<min(numberOfSegments, localizedTitles.count) {
            setTitle(localizedTitles[index].localized, forSegmentAt: index)
        }
    }
    
    private func localizeFont() {
        setTitleTextAttributes([NSAttributedString.Key.font: UIFont.segmentedControlItem()], for: .normal)
    }
}

extension UIViewController: Localizable {
    
    @IBInspectable var localizedTitle: String {
        get { return associated(&Key.title) ?? "" }
        set {
            associate(newValue as AnyObject?, &Key.title)
            localize()
        }
    }
    
    @objc func localize() {
        // Bars
        if let navTitleView = navigationItem.titleView {
            localizeView(navTitleView)
        }
        navigationItem.localize()
        navigationItem.leftBarButtonItems? .forEach{ $0.localize() }
        navigationItem.rightBarButtonItems?.forEach{ $0.localize() }
        tabBarItem.localize()
        
        // Self
        localizeView(view)
        
        // View controllers
        children.forEach{ $0.localize() }
        presentedViewController?.localize()
        
        if !localizedTitle.isEmpty { title = localizedTitle.localized }
    }
    
    private func localizeView(_ view: UIView) {
        if let localizable = view as? Localizable {
            localizable.localize()
        }
        view.subviews.forEach{ localizeView($0) }
    }
}

extension UIApplication: Localizable {
    
    func localize() {
        windows.forEach { $0.rootViewController?.localize() }
    }
}

