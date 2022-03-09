//
//  WeatherViewModel.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 04/03/2022.
//

import Foundation
import UIKit

final class WeatherViewModel {
    
    private let weatherManager = WeatherManager.shared
    private let userDefaultsManager = UserDefaultsManager.shared
    
    var onUpdateTable: (() -> Void)?
    var onShowAlert: (() -> Void)?
    
    init() {
        UserDefaultsManager.shared.getItems()
    }
    
    func shouldUpdateTable() {
        self.onUpdateTable?()
    }
    
    func shouldShowAlert() {
        self.onShowAlert?()
    }
    
    func getValue(index: Int) -> WeatherModel? {
        return weatherManager.getValue(index: index)
    }
    
    func getTableItemsCount() -> Int? {
        return weatherManager.tableItems.count
    }
    
    func addItemToTable(item: WeatherModel) {
        weatherManager.addItemToTable(weatherItem: item)
    }
    
    func fetchWeather(for city: String) {
        NetworkManager.fetchWeather(for: city) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self.addItemToTable(item: weather)
                    self.shouldUpdateTable()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
