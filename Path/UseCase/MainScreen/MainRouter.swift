//
//  MainRouter.swift
//  Path
//
//  Created by PatrykD on 13/02/2021.
//

import UIKit

protocol MainRouterType: class {
    func showMainScreen()
    init(mainView: View, mainPresenter: MainPresenterType)
}

typealias View = (MainViewType & UIViewController)

final class MainRouter: MainRouterType {
    var mainView: View?
    var mainPresenter: MainPresenterType
    var window: UIWindow?
    
    init(mainView: View, mainPresenter: MainPresenterType = MainPresenter()) {
        self.mainView = mainView
        self.mainPresenter = mainPresenter
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func showMainScreen() {
        let interactor = MainInteractor(presenter: mainPresenter)
        
        mainPresenter.interactor = interactor
        mainPresenter.view = mainView
        mainPresenter.router = self
        
        mainView?.presenter = mainPresenter
        mainView?.viewFactory = ViewsFactory()
        
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
    }
}
