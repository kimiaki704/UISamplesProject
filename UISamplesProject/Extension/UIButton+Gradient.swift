//
//  UIButton+Gradient.swift
//  UISamplesProject
//
//  Created by 鈴木公章 on 2019/11/19.
//  Copyright © 2019 鈴木公章. All rights reserved.
//

import UIKit

extension UIButton {
    func setGradientBackgroundColors(_ colors: [UIColor], direction: ImageGradientDirection, for state: UIControl.State) {
        if colors.count > 1 {
            // Gradient background
            setBackgroundImage(UIImage(size: CGSize(width: 1, height: 1), direction: direction, colors: colors), for: state)
        }
        else {
            if let color = colors.first {
                // Mono color background
                setBackgroundImage(UIImage(color: color, size: CGSize(width: 1, height: 1)), for: state)
            }
            else {
                // Default background color
                setBackgroundImage(nil, for: state)
            }
        }
    }
}
