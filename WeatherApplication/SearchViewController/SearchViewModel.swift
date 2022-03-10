//
//  SearchViewModel.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 10/03/2022.
//

import Foundation

final class SearchViewModel {
    
    var onOpenWeatherViewController: (() -> Void)?
    var onUpdateTable: (() -> Void)?
    var onShowErrorAlert: (() -> Void)?
    
    func shouldUpdateTable() {
        self.onUpdateTable?()
    }
    
    func shouldOpenWeatherViewController() {
        self.onOpenWeatherViewController?()
    }
    
    func shouldShowErrorAlert() {
        self.onShowErrorAlert?()
    }
    
    func addItemToTable(item: WeatherModel) {
        WeatherManager.shared.addItemToTable(weatherItem: item)
    }
    
    func fetchWeather(for city: String) {
        NetworkManager.fetchWeather(for: city) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self.addItemToTable(item: weather)
                    self.shouldOpenWeatherViewController()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
