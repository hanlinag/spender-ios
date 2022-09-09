//
//  AssociateObject.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import ObjectiveC

extension NSObject {
    
    func associated<T>(_ key: UnsafeRawPointer) -> T? {
        return objc_getAssociatedObject(self, key) as? T
    }
    
    func associate(_ value: AnyObject?, _ key: UnsafeRawPointer) {
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
}
