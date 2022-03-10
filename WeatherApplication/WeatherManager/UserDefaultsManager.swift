//
//  UserDefaultsManager.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 09/03/2022.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    let key = "weatherItems"
    let defaults = UserDefaults(suiteName: "com.deniss.lobacs")
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(WeatherManager.shared.tableItems) {
            defaults?.set(encodedData, forKey: key)
        }
    }
    
    func getItems() {
        guard let data = defaults?.data(forKey: key),
              let savedItems = try? JSONDecoder().decode([WeatherModel].self, from: data) else { return }
        WeatherManager.shared.tableItems = savedItems
    }
    
}
