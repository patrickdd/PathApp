//
//  String+extension.swift
//  Path
//
//  Created by PatrykD on 16/02/2021.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
