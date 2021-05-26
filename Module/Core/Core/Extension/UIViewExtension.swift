//
//  UIViewExtension.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

public extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    func setShadow(color: CGColor, opacity: Float) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 1)
    }
}
