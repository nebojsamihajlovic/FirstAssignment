//
//  RoundedButton.swift
//  TestButton
//
//  Created by Nebojsa Mihajlovic on 2/21/17.
//  Copyright © 2017 Nebojsa Mihajlovic. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton:UIButton {

    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
    }
}
