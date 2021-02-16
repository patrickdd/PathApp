//
//  MainFactory.swift
//  Path
//
//  Created by PatrykD on 13/02/2021.
//

import Foundation

protocol MainFactoryType {
    static func makeMainView() -> View
    static func makeMainPresenter() -> MainPresenterType
}

final class MainFactory: MainFactoryType {
    
    static func makeMainView() -> View {
        return MainViewController()
    }
    
    static func makeMainPresenter() -> MainPresenterType {
        return MainPresenter()
    }
}
