//
//  Extensions.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 8/24/21.
//

import UIKit

extension UITextField {
    
    func setLeftPaddingPoints(_ space: CGFloat)
    {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: space, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension UIView {
    
        
    func setAnchor(width: CGFloat, height: CGFloat)
    {
        self.setAnchor(
            top: nil,
            bottom: nil,
            left: nil,
            right: nil,
            paddingTop: 0,
            paddingBottom: 0,
            paddingLeft: 0,
            paddingRight: 0,
            width: width,
            height: height
            )
    }
    
    func setAnchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?,
                   left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?,
                   paddingTop: CGFloat, paddingBottom: CGFloat,
                   paddingLeft: CGFloat, paddingRight: CGFloat,
                   width: CGFloat = 0, height: CGFloat = 0)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }        
    }
    
    
}
