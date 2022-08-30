//
//  Date + Extensions.swift
//  Spender
//
//  Created by Tyler on 30/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

//MARK: - String
extension String {
    
    func toDate(withFormat format: String = dateFormatForView)-> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
    }
    
    
}


//MARK: - Date
extension Date {
    func toString(withFormat format: String = dateFormatForView) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)
        
        return str
    }
}
