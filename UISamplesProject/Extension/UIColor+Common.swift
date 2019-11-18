//
//  UIColor+Common.swift
//  UISamplesProject
//
//  Created by 鈴木公章 on 2019/11/19.
//  Copyright © 2019 鈴木公章. All rights reserved.
//

import UIKit

extension UIColor {
    
    private static func colorWithDecimal(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return colorWithDecimal(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func colorWithDecimal(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
    
    static func colorWithHex(color24: NSInteger) -> UIColor {
        let r: Int = (color24 >> 16)
        let g: Int = (color24 >> 8 & 0xFF)
        let b: Int = (color24 & 0xFF)
        return colorWithDecimal(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
    }
    
    static func colorWithHex(color24: Int, alpha: CGFloat) -> UIColor {
        let r: Int = (color24 >> 16)
        let g: Int = (color24 >> 8 & 0xFF)
        let b: Int = (color24 & 0xFF)
        return colorWithDecimal(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(alpha))
    }
}
