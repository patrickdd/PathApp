//
//  PointsData.swift
//  Path
//
//  Created by PatrykD on 13/02/2021.
//

import Foundation

struct PointsData: Decodable {
    let longitude: String
    let latitude: String
    let altitude: String
    let accuracy: String
    let distance: String
}

extension PointsData: Equatable {
    static func == (lhs: PointsData, rhs: PointsData) -> Bool {
        return (lhs.longitude == rhs.longitude) && (lhs.latitude == rhs.latitude)
    }
}
