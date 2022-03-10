//
//  TaskManager.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 04/03/2022.
//

import Foundation

class WeatherManager {
    
    static var shared = WeatherManager()
    
    private init() {}
    
    var tableItems: [WeatherModel] = Weather.model
    
    func addItemToTable(weatherItem: WeatherModel) {
        
        
        for item in tableItems {
            if weatherItem.cityName == item.cityName { return }
        }
        tableItems.append(weatherItem)
        
        Weather.model.append(weatherItem)
    }
    
    func getValue(index: Int) -> WeatherModel? {
        guard tableItems.count > index else { return nil }
        return tableItems[index]
    }
    
}
