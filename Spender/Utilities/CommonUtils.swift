//
//  CommonUtils.swift
//  Spender
//
//  Created by Tyler on 04/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import UIKit

func getViewControllerFromInstantiateStoryboard(for type: StoryboardType, transitionStype: UIModalTransitionStyle = .crossDissolve, presentationStyle: UIModalPresentationStyle = .overCurrentContext, hideBottomBar: Bool = false) -> SpenderViewController {
    
    let storyboard = UIStoryboard(name: type.string, bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: type.string) as! SpenderViewController
    vc.modalTransitionStyle     = transitionStype
    vc.modalPresentationStyle   = presentationStyle
    vc.hidesBottomBarWhenPushed = hideBottomBar
    
    return vc
}
