//
//  UserDefault.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 10/03/2022.
//

import Foundation

@propertyWrapper
struct UserDefault<T: Codable> {
    let key: String
    let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            UserDefaults.standard.get(key: key) ?? defaultValue
        }
        set {
            UserDefaults.standard.set(value: newValue, key: key)
        }
    }
}

extension UserDefaults {
    
    func set<Element: Codable>(value: Element, key: String) {
        let data = try? JSONEncoder().encode(value)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func get<Element: Codable>(key: String) -> Element? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        let decodedData = try? JSONDecoder().decode(Element.self, from: data)
        return decodedData
    }
}
