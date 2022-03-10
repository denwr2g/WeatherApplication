//
//  UserDefaultsManager.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 09/03/2022.
//

import Foundation

//class UserDefaultsManager {
//    
//    static let shared = UserDefaultsManager()
//    
//    private init() {}
//    
//    let key = "weatherItem15"
//    let defaults = UserDefaults(suiteName: "com.deniss.lobacs")
//    
//    func save() {
//        if let encodedData = try? JSONEncoder().encode(WeatherManager.shared.tableItems) {
//            defaults?.set(encodedData, forKey: key)
//            print("encodedData \(encodedData)")
//        }
//        
//    }
//    
//    func getItems() {
//        guard let data = defaults?.data(forKey: key),
//              let savedItems = try? JSONDecoder().decode([WeatherModel].self, from: data) else { return }
//        print("data \(data)")
//        WeatherManager.shared.tableItems = savedItems
//    }
//    
//}
