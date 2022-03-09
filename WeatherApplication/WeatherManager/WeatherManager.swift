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
    
    var tableItems = [WeatherModel?]() {
        didSet {
            UserDefaultsManager.shared.save()
        }
    }
    
    func addItemToTable(weatherItem: WeatherModel?) {
              
        guard let weatherItem = weatherItem else { return }
        
        for item in tableItems {
            if weatherItem.cityName == item?.cityName { return }
        }
        tableItems.append(weatherItem)
    }
    
    func getValue(index: Int) -> WeatherModel? {
        guard tableItems.count > index else { return nil }
        return tableItems[index]
    }
    
}
