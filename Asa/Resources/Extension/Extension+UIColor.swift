//
//  Extension+Cell.swift
//  Asa
//
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import UIKit

extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
    func compareColor(color: UIColor) -> Bool{
        
        if self.toHexString() == color.toHexString() {
            return true
        }
        
        return false
    }
}
