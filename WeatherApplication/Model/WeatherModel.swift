//
//  WeatherModel.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 04/03/2022.
//

import Foundation

struct Weather {
    @UserDefault(key: "test13", defaultValue: [])
    static var model: [WeatherModel]
}

struct WeatherModel: Codable {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.2f", temperature) + "° C"
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "smoke"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "nosign"
        }
    }
    
    init(conditionId: Int, cityName: String, temperature: Double) {
        self.conditionId = conditionId
        self.cityName = cityName
        self.temperature = temperature
    }
    
    init(from decoder: Decoder) throws {
        let contreiner = try decoder.container(keyedBy: CodingKeys.self)
        self.conditionId = try contreiner.decode(Int.self, forKey: .conditionID)
        self.cityName = try contreiner.decode(String.self, forKey: .cityName)
        self.temperature = try contreiner.decode(Double.self, forKey: .temperature)
    }
    
    func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(conditionId, forKey: .conditionID)
        try container.encode(cityName, forKey: .cityName)
        try container.encode(temperature, forKey: .temperature)
    }
    
    enum CodingKeys: CodingKey {
        case conditionID
        case cityName
        case temperature
    }
}
