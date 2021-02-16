//
//  Resusable.swift
//  Path
//
//  Created by PatrykD on 15/02/2021.
//

import UIKit

protocol  Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}

