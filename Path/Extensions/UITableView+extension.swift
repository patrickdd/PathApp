//
//  UITableView+extension.swift
//  Path
//
//  Created by PatrykD on 15/02/2021.
//

import UIKit

extension UITableView {
    func dequeue<T:Reusable>(_ indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func registerReusableCell<T: UITableViewCell & Reusable>(_: T.Type)   {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
}
