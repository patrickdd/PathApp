//
//  MainInteractor.swift
//  Path
//
//  Created by PatrykD on 13/02/2021.
//

import Foundation

protocol MainInteractorType {
    func loadPathData(completion: ([PointsData]) -> ())
    init(presenter: MainPresenterType, pathLoader: PathLoaderType)
}

class MainInteractor: MainInteractorType {
    weak var presenter: MainPresenterType?
    var pathLoader: PathLoaderType?
    
    required init(presenter: MainPresenterType, pathLoader: PathLoaderType = PathLoader()) {
        self.pathLoader = pathLoader
        self.presenter = presenter
    }
    
    func loadPathData(completion: ([PointsData]) -> ()) {
        do {
            guard let jsonData = try pathLoader?.loadData() else { return }
            let pointsDataArray = try JSONDecoder().decode([PointsData].self, from: jsonData)
            completion(pointsDataArray)
        } catch let error {
            print("Error during loading \(error)")
        }
    }
}
