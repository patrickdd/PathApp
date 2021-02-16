//
//  MainPresenter.swift
//  Path
//
//  Created by PatrykD on 13/02/2021.
//

import Foundation

protocol MainPresenterType: class {
    var interactor: MainInteractorType? { get set }
    var view: MainViewType?  { get set }
    var router: MainRouterType?  { get set }
    var itemsCount: Int { get }
    func getItem(with index: Int) -> PointsData
    func loadData(completion: (() -> ())?)
}

class MainPresenter: MainPresenterType {
    var interactor: MainInteractorType?
    var view: MainViewType?
    weak var router: MainRouterType?
    private var pointsArray = [PointsData]()
    
    func loadData(completion: (() -> ())?) {
        pointsArray.removeAll()
        interactor?.loadPathData(completion: { [weak self] pointsData in
            self?.pointsArray.append(contentsOf: pointsData)
            view?.showPointsOnMap(with: pointsData)
            completion?()
        })
    }
}

// MARK: Public methods related with items
extension MainPresenter {
    var itemsCount: Int {
        pointsArray.count
    }
    
    func getItem(with index: Int) -> PointsData {
        return pointsArray[index]
    }
}
