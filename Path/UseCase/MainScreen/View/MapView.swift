//
//  MapView.swift
//  Path
//
//  Created by PatrykD on 14/02/2021.
//

import UIKit
import GoogleMaps

class MapView: GMSMapView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialise()
    }
    
    override init(frame: CGRect, camera: GMSCameraPosition) {
        super.init(frame: frame, camera: camera)
        initialise()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialise()
    }
}

private extension MapView {
    func initialise() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
