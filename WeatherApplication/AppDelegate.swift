//
//  AppDelegate.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 03/03/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = makeNavigationController()
        
        return true
    }
    
    func makeWeatherViewController() -> UIViewController {
        let viewController = WeatherViewController()
        let weatherViewModel = WeatherViewModel()
        
        viewController.configure(viewModel: weatherViewModel)
        
        weatherViewModel.onUpdateTable = { viewController.updateTableView() }
        
        return viewController
    }
    
    func makeNavigationController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: makeWeatherViewController())
        navigationController.navigationBar.barTintColor = .systemBlue
        UINavigationBar.appearance().tintColor = .white
        return navigationController
    }

}

