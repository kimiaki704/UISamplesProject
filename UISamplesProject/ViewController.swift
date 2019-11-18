//
//  ViewController.swift
//  UISamplesProject
//
//  Created by 鈴木公章 on 2019/11/18.
//  Copyright © 2019 鈴木公章. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colors = [UIColor.colorWithHex(color24: 0xFF8960), UIColor.colorWithHex(color24: 0xFF62A5)]
        button.setGradientBackgroundColors(colors, direction: .toRight, for: .normal)
        button.layer.cornerRadius = 40
        button.layer.masksToBounds = true
    }


}

