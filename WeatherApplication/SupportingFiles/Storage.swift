//
//  Storage.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 07/03/2022.
//

import Foundation

@propertyWrapper
struct Storage<Value: Codable> {
    let key: String
    var container: UserDefaults = .standard

    var wrappedValue: Value? {
        get {
            // Read value from UserDefaults
            guard let data = container.data(forKey: key) else { return nil }
            return try? JSONDecoder().decode(Value.self, from: data)
        }
        set {
            // Set value to UserDefaults
            if let newValue = newValue, let data = try? JSONEncoder().encode(newValue) {
                container.set(data, forKey: key)
            } else {
                container.removeObject(forKey: key)
            }
        }
    }
}
