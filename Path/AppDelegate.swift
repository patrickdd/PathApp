//
//  AppDelegate.swift
//  Path
//
//  Created by PatrykD on 13/02/2021.
//

import UIKit
import GoogleMaps

private let googleMapsKey = "AIzaSyAJBgHbhoEIhrBUlBzIdd5PvJCiCDhyR7w"
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var mainRouter: MainRouterType?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(googleMapsKey)
        mainRouter = MainRouter(mainView: MainFactory.makeMainView())
        mainRouter?.showMainScreen()
        return true
    }
}

