//
//  UIColor+Utility.swift
//  Coverd
//
//  Created by subhajit halder on 12/02/17.
//  Copyright © 2017 SubhajitHalder. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
    
    static var primary: UIColor  { get { return UIColor(red:1.00, green:0.62, blue:0.20, alpha:1.0) } }
    static var secondColor: UIColor { get { return UIColor(red: 0, green: 1, blue: 0, alpha: 1) } }
    
    static var colorTextSelected: UIColor { get { return UIColor(red: 0.165, green: 0.165, blue: 0.165, alpha: 1) } }

    static var colorTextUnselected: UIColor { get { return UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1) } }


}
