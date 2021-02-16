//
//  UIFont+extension.swift
//  Path
//
//  Created by PatrykD on 15/02/2021.
//

import UIKit

extension UIFont {
    static func makeDefault(with size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func makeDefaultBold(with size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
