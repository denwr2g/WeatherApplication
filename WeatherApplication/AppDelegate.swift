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
    var navigationController: UINavigationController?
    var weatherViewController: WeatherViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        setupNavigationController()
        window?.rootViewController = navigationController
        
        return true
    }
    
    func makeWeatherViewController() -> UIViewController {
        let viewController = WeatherViewController()
        let weatherViewModel = WeatherViewModel()
        weatherViewModel.onGoToSearchViewController = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.makeSearchViewController(weatherViewController: viewController), animated: true)
        }
        
        weatherViewModel.onGoToDetailViewController = { [weak self] weather in
            guard let self = self else { return }
            self.navigationController?.present(self.makeDetailViewController(weather: weather), animated: true, completion: nil)
        }
        
        viewController.configure(viewModel: weatherViewModel)
        return viewController
    }
    
    func makeSearchViewController(weatherViewController: WeatherViewController) -> UIViewController {
        let viewController = SearchViewController()
        let searchViewModel = SearchViewModel()
        
        searchViewModel.onOpenWeatherViewController = { [weak self] in
            guard let self = self else { return }
            weatherViewController.updateTableViewContent()
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        viewController.configure(viewModel: searchViewModel)
        return viewController
    }
    
    func makeDetailViewController(weather: WeatherModel) -> UIViewController {
        let viewContoller = DetailViewController()
        let viewModel = DetailViewModel()
        viewContoller.configItems(for: weather)
        viewContoller.configure(viewModel: viewModel)
        return viewContoller
    }
    
    func setupNavigationController() {
        navigationController = UINavigationController(rootViewController: makeWeatherViewController())
        navigationController?.navigationBar.barTintColor = .systemBlue
        UINavigationBar.appearance().tintColor = .white
    }
    
   
}

