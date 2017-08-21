//
//  NSDictionary+Utility.swift
//  
//
//  Created by subhajit halder on 21/02/17.
//  Copyright © 2017 SubhajitHalder. All rights reserved.
//

import Foundation

extension NSDictionary {
    
    func toStringFrom(key akey: String) -> String {
        if let str = self[akey] as? String {
            return str
        } else {
            return ""
        }
    }
    
    func toNSArrayFrom(key aKey: String) -> NSArray {
        if let arr = self[aKey] as? NSArray {
            return arr
        } else {
            return []
        }
    }
    
    func toIntFrom(key akey: String) -> Int {
        if let int = self[akey] as? Int {
            return int
        } else {
            return 0
        }
    }
    
    func toFloatFrom(key akey: String) -> Float {
        if let float = self[akey] as? Float {
            return float
        } else {
            return 0.0
        }
    }
    
    
    func toBoolFrom(key akey: String) -> Bool {
        if let bool = self[akey] as? Bool {
            return bool
        } else {
            return false
        }
    }
    
}
