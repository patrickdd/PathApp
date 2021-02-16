//
//  UIView+extension.swift
//  Path
//
//  Created by PatrykD on 14/02/2021.
//

import UIKit

extension UIView {
    func setUpShadow() {
        layer.shadowColor = UIColor.scienceBlue.cgColor
        layer.shadowRadius = 3.0
        layer.shadowRadius = 10
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.masksToBounds = false
    }
    
    func setRoundedCorners() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}

