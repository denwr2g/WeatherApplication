//
//  WeatherViewModel.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 04/03/2022.
//

import Foundation

final class WeatherViewModel {
    
    private let taskManager = TaskManager.shared
    
    var onUpdateTable: (() -> Void)?
    
    func shouldUpdateTable() {
        self.onUpdateTable?()
    }
    
    func getValue(index: Int) -> WeatherModel? {
       return taskManager.getValue(index: index)
    }
    
    func getTableItemsCount() -> Int? {
        return taskManager.tableItems.count
    }
    
    func addItemToTable(item: WeatherModel) {
        taskManager.addItemToTable(weatherItem: item)
    }
    
    func fetchWeather(for city: String) {
        WeatherManager.shared.fetchWeather(for: city) { [weak self] weather in
            guard let self = self else {return}
            guard let weather = weather else {return}
            self.addItemToTable(item: weather)
            self.shouldUpdateTable()
        }
    }
    

}
