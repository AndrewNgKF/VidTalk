//
//  RoundTextField.swift
//  VidTalk
//
//  Created by IMAC on 3/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//

import Foundation




@IBDesignable

class RoundTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.CGColor
        }
    }
    
    @IBInspectable var bgColor: UIColor? {
        
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            
            let str = NSAttributedString(string: rawString, attributes: [NSForegroundColorAttributeName : placeholderColor!])
            
            attributedPlaceholder = str
            
        }
    }
    
    
    
}