//
//  UIStackView+extension.swift
//  Path
//
//  Created by PatrykD on 16/02/2021.
//

import UIKit

extension UIStackView {
    func removeAllArrangedViews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
