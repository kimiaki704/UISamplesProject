//
//  UIImage+Gradient.swift
//  UISamplesProject
//
//  Created by 鈴木公章 on 2019/11/19.
//  Copyright © 2019 鈴木公章. All rights reserved.
//

import UIKit

// https://github.com/tungvoduc/DTGradientButton

enum ImageGradientDirection {
    case toLeft
    case toRight
    case toTop
    case toBottom
    case toBottomLeft
    case toBottomRight
    case toTopLeft
    case toTopRight
}

extension UIImage {
    convenience init?(size: CGSize, direction: ImageGradientDirection, colors: [UIColor]) {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        guard colors.count >= 1 else { return nil }
        
        if colors.count == 1 {
            // Mono color
            let color = colors.first!
            color.setFill()
            
            let rect = CGRect(origin: CGPoint.zero, size: size)
            UIRectFill(rect)
        }
        else {
            // Gradient color
            var location: CGFloat = 0
            var locations: [CGFloat] = []
            
            for (index, _) in colors.enumerated() {
                let index = CGFloat(index)
                locations.append(index / CGFloat(colors.count - 1))
            }
            
            guard let gradient = CGGradient(colorSpace: CGColorSpaceCreateDeviceRGB(), colorComponents: colors.compactMap { $0.cgColor.components }.flatMap { $0 }, locations: locations, count: colors.count) else {
                return nil
            }
            
            var startPoint: CGPoint
            var endPoint: CGPoint
            
            switch direction {
            case .toLeft:
                startPoint = CGPoint(x: size.width, y: size.height/2)
                endPoint = CGPoint(x: 0.0, y: size.height/2)
            case .toRight:
                startPoint = CGPoint(x: 0.0, y: size.height/2)
                endPoint = CGPoint(x: size.width, y: size.height/2)
            case .toTop:
                startPoint = CGPoint(x: size.width/2, y: size.height)
                endPoint = CGPoint(x: size.width/2, y: 0.0)
            case .toBottom:
                startPoint = CGPoint(x: size.width/2, y: 0.0)
                endPoint = CGPoint(x: size.width/2, y: size.height)
            case .toBottomLeft:
                startPoint = CGPoint(x: size.width, y: 0.0)
                endPoint = CGPoint(x: 0.0, y: size.height)
            case .toBottomRight:
                startPoint = CGPoint(x: 0.0, y: 0.0)
                endPoint = CGPoint(x: size.width, y: size.height)
            case .toTopLeft:
                startPoint = CGPoint(x: size.width, y: size.height)
                endPoint = CGPoint(x: 0.0, y: 0.0)
            case .toTopRight:
                startPoint = CGPoint(x: 0.0, y: size.height)
                endPoint = CGPoint(x: size.width, y: 0.0)
            }
            
            context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions())
        }
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            return nil
        }
        
        self.init(cgImage: image)
        
        defer { UIGraphicsEndImageContext() }
    }
    
    convenience init?(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIRectFill(rect)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            return nil
        }
        
        self.init(cgImage: image)
        
        defer { UIGraphicsEndImageContext() }
    }
}
